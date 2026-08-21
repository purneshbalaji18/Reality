import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class ApiConfig {
  static String baseUrl = 'http://10.0.2.2:8000';
}

Color getHarmColor(String? harmLevel) {
  switch (harmLevel?.toLowerCase()) {
    case 'low':
    case 'safe':
      return const Color(0xFF10B981);
    case 'moderate':
      return const Color(0xFFF59E0B);
    case 'high':
      return const Color(0xFFEF4444);
    case 'critical':
      return const Color(0xFFDC2626);
    default:
      return const Color(0xFF38BDF8);
  }
}

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _textController = TextEditingController(
    text: "Water, Stearic Acid, Niacinamide, Glycerin, Phenoxyethanol, Titanium Dioxide, Methylparaben, Triclosan",
  );
  final TextEditingController _barcodeController = TextEditingController(text: "8901030000000");

  bool _isLoading = false;
  Map<String, dynamic>? _scanResult;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _performTextScan() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    _sendScanRequest('${ApiConfig.baseUrl}/api/v1/scan/text', jsonEncode({'raw_ingredient_text': text}));
  }

  Future<void> _performBarcodeScan() async {
    final code = _barcodeController.text.trim();
    if (code.isEmpty) return;

    _sendScanRequest('${ApiConfig.baseUrl}/api/v1/scan/barcode', jsonEncode({'barcode': code}));
  }

  // FIX 12 — Image compression before OCR upload (maxWidth: 1200, maxHeight: 1200, quality: 82)
  Future<void> _performImagePickerScan() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1200,
      maxHeight: 1200,
      imageQuality: 82,
    );
    if (image == null) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _scanResult = null;
    });

    try {
      final request = http.MultipartRequest('POST', Uri.parse('${ApiConfig.baseUrl}/api/v1/scan/ocr'));
      request.files.add(await http.MultipartFile.fromPath('file', image.path));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _scanResult = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'OCR error (${response.statusCode}): Could not process packaging image.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Connection error: Backend unreachable at ${ApiConfig.baseUrl}';
        _isLoading = false;
      });
    }
  }

  Future<void> _sendScanRequest(String url, String body) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _scanResult = null;
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _scanResult = data;
          _isLoading = false;
        });
      } else {
        final err = jsonDecode(response.body);
        setState(() {
          _errorMessage = err['detail'] ?? 'Scan error: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Connection failed: Ensure backend server is running on ${ApiConfig.baseUrl}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // FIX 4 — Predictive back gesture enforcement for Android 16 (API 36)
    return PopScope(
      canPop: !_isLoading,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Scan in progress. Please wait for toxicology analysis to finish...'),
              backgroundColor: Color(0xFF6366F1),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F172A),
          title: const Text('Product Scanner', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF818CF8),
            labelColor: const Color(0xFF818CF8),
            unselectedLabelColor: Colors.white54,
            tabs: const [
              Tab(icon: Icon(Icons.short_text), text: 'Text Label'),
              Tab(icon: Icon(Icons.qr_code_scanner), text: 'Barcode'),
              Tab(icon: Icon(Icons.camera_alt), text: 'OCR Image'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 220,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Tab 1: Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Paste or Type Ingredient List:', style: TextStyle(color: Colors.white70)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _textController,
                          maxLines: 3,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFF1E293B),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: _isLoading ? null : _performTextScan,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6366F1),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.analytics_outlined),
                          label: const Text('Analyze Ingredients Text', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),

                    // Tab 2: Barcode
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Enter EAN-13 / UPC Barcode:', style: TextStyle(color: Colors.white70)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _barcodeController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'e.g. 8901030000000',
                            prefixIcon: const Icon(Icons.qr_code, color: Colors.white54),
                            filled: true,
                            fillColor: const Color(0xFF1E293B),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                          ),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton.icon(
                          onPressed: _isLoading ? null : _performBarcodeScan,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF38BDF8),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.search),
                          label: const Text('Lookup Product Barcode', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),

                    // Tab 3: Image OCR
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _isLoading ? null : _performImagePickerScan,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFA855F7),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          icon: const Icon(Icons.photo_library_outlined, size: 28),
                          label: const Text('Pick Ingredient Label Photo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Compressed for high-speed Tesseract OCR analysis',
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              if (_isLoading) ...[
                const SizedBox(height: 20),
                const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(color: Color(0xFF818CF8)),
                      SizedBox(height: 12),
                      Text('Analyzing Clinical Toxicology Database...', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ],

              if (_errorMessage != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.redAccent.withValues(alpha: 0.5)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.redAccent),
                      const SizedBox(width: 12),
                      Expanded(child: Text(_errorMessage!, style: const TextStyle(color: Colors.redAccent, fontSize: 13))),
                    ],
                  ),
                )
              ],

              if (_scanResult != null) ...[
                const SizedBox(height: 24),
                const Divider(color: Colors.white12),
                const SizedBox(height: 16),

                // Product Info Header if Barcode
                if (_scanResult!['product'] != null) ...[
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.inventory_2_outlined, color: Color(0xFF818CF8)),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _scanResult!['product']['name'] ?? 'Known FMCG Product',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              'Brand: ${_scanResult!['product']['brand'] ?? 'N/A'} • Barcode: ${_scanResult!['product']['barcode'] ?? ''}',
                              style: const TextStyle(color: Colors.white54, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Harm Summary Card
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: getHarmColor(_scanResult!['overall_harm_level']),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Harm Rating:', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: getHarmColor(_scanResult!['overall_harm_level']).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              (_scanResult!['overall_harm_level'] ?? 'UNKNOWN').toString().toUpperCase(),
                              style: TextStyle(
                                color: getHarmColor(_scanResult!['overall_harm_level']),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _scanResult!['toxicology_summary']?['clinical_explanation'] ?? 'Analysis complete.',
                        style: const TextStyle(color: Color(0xE6FFFFFF), fontSize: 13, height: 1.4),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                  'Ingredient Breakdown (${(_scanResult!['ingredients'] as List?)?.length ?? 0} items)',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ((_scanResult!['ingredients'] as List?) ?? []).length,
                  itemBuilder: (context, index) {
                    final ing = _scanResult!['ingredients'][index];
                    final name = ing['raw_name'] ?? ing['canonical_name'] ?? 'Compound';
                    final harm = ing['harm_level'] ?? 'safe';
                    final isResolved = ing['is_resolved'] ?? false;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: getHarmColor(harm).withValues(alpha: 0.2),
                          child: Icon(
                            isResolved ? Icons.shield_outlined : Icons.help_outline,
                            color: getHarmColor(harm),
                          ),
                        ),
                        title: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                        subtitle: Text(
                          isResolved ? 'Resolved in toxicology database' : 'Unresolved compound',
                          style: const TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                        trailing: Text(
                          harm.toString().toUpperCase(),
                          style: TextStyle(color: getHarmColor(harm), fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
