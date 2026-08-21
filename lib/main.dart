import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const AntigravityApp());
}

class AntigravityApp extends StatelessWidget {
  const AntigravityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antigravity — Product Safety',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        cardTheme: CardThemeData(
          color: const Color(0xFF1E293B),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      home: const MainNavigationContainer(),
    );
  }
}

// ------------------------------------------------------------------
// CONFIG & HELPERS
// ------------------------------------------------------------------

class ApiConfig {
  // 10.0.2.2 connects from Android Emulator to Host PC localhost
  static String baseUrl = 'http://10.0.2.2:8000';
}

Color getHarmColor(String? harmLevel) {
  switch (harmLevel?.toLowerCase()) {
    case 'low':
    case 'safe':
      return const Color(0xFF10B981); // Emerald green
    case 'moderate':
      return const Color(0xFFF59E0B); // Amber
    case 'high':
      return const Color(0xFFEF4444); // Red
    case 'critical':
      return const Color(0xFFDC2626); // Deep red
    default:
      return const Color(0xFF38BDF8); // Sky blue
  }
}

// ------------------------------------------------------------------
// MAIN NAVIGATION CONTAINER WITH BOTTOM NAV BAR
// ------------------------------------------------------------------

class MainNavigationContainer extends StatefulWidget {
  const MainNavigationContainer({super.key});

  @override
  State<MainNavigationContainer> createState() => _MainNavigationContainerState();
}

class _MainNavigationContainerState extends State<MainNavigationContainer> {
  int _currentIndex = 0;

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      HomeScreen(onNavigateToScan: (scanType) {
        setState(() {
          _currentIndex = 1;
        });
      }),
      const ScannerScreen(),
      const IngredientLibraryScreen(),
      const RegulatoryGuideScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF0F172A),
        indicatorColor: const Color(0xFF6366F1).withOpacity(0.3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFF818CF8)),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.qr_code_scanner_outlined),
            selectedIcon: Icon(Icons.qr_code_scanner, color: Color(0xFF818CF8)),
            label: 'Scan & Check',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book, color: Color(0xFF818CF8)),
            label: 'Ingredients',
          ),
          NavigationDestination(
            icon: Icon(Icons.verified_user_outlined),
            selectedIcon: Icon(Icons.verified_user, color: Color(0xFF818CF8)),
            label: 'Regulatory',
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------
// 1. HOME SCREEN DASHBOARD
// ------------------------------------------------------------------

class HomeScreen extends StatelessWidget {
  final Function(String scanType) onNavigateToScan;

  const HomeScreen({super.key, required this.onNavigateToScan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: const Row(
          children: [
            Text('🧪 ', style: TextStyle(fontSize: 22)),
            Text(
              'ANTIGRAVITY',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white70),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Antigravity India',
                applicationVersion: '1.0.0 MVP',
                applicationIcon: const Text('🧪', style: TextStyle(fontSize: 32)),
                children: [
                  const Text('Product Safety & Clinical Toxicology Intelligence for the Indian Market.'),
                  const SizedBox(height: 8),
                  const Text('Powered by FSSAI, CDSCO, BIS, EU ECHA & Open Food Facts data.'),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero banner card
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF9333EA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6366F1).withOpacity(0.4),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '🇮🇳 Product Safety Intelligence India',
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Know what\'s really inside your food & cosmetics.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Scan barcodes or packaging labels to detect toxic additives, parabens, & regulatory flags.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Quick Action Buttons
            const Text(
              'Quick Scan Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _QuickScanCard(
                    icon: Icons.qr_code_2_rounded,
                    title: 'Barcode Scan',
                    subtitle: 'EAN-13 / Indian FMCG',
                    color: const Color(0xFF38BDF8),
                    onTap: () => onNavigateToScan('barcode'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _QuickScanCard(
                    icon: Icons.camera_alt_outlined,
                    title: 'Label OCR',
                    subtitle: 'Scan packaging text',
                    color: const Color(0xFFA855F7),
                    onTap: () => onNavigateToScan('ocr'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _QuickScanCard(
              icon: Icons.short_text_rounded,
              title: 'Manual Text Analysis',
              subtitle: 'Paste ingredient list directly for toxicology audit',
              color: const Color(0xFF34D399),
              onTap: () => onNavigateToScan('text'),
            ),

            const SizedBox(height: 28),

            // Featured Indian Products
            const Text(
              'Sample Indian FMCG Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            _SampleProductCard(
              title: 'Glow & Lovely Advanced Multivitamin',
              category: 'Skincare Cream',
              ingredientsCount: '18 ingredients',
              harmLevel: 'Moderate',
              harmColor: Colors.amberAccent,
            ),
            _SampleProductCard(
              title: 'Colgate Strong Teeth Toothpaste',
              category: 'Oral Hygiene',
              ingredientsCount: '12 ingredients (Triclosan, SLS)',
              harmLevel: 'Moderate',
              harmColor: Colors.amberAccent,
            ),
            _SampleProductCard(
              title: 'Maggi 2-Minute Masala Noodles',
              category: 'Packaged Food',
              ingredientsCount: '14 additives (INS 621, Palm Oil)',
              harmLevel: 'Moderate',
              harmColor: Colors.amberAccent,
            ),

            const SizedBox(height: 24),
            // High Risk Watchlist Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                      SizedBox(width: 8),
                      Text(
                        'Watchlist: Restricted Additives in India',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Triclosan — Endocrine disruptor restricted by EU/US.\n'
                    '• Methylparaben — Preservative with hormone mimic risk.\n'
                    '• INS 621 (MSG) — Excitotoxin requiring warnings for children under 12.\n'
                    '• Tartrazine (INS 102) — Artificial yellow dye linked to hyperkinesis.',
                    style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickScanCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickScanCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}

class _SampleProductCard extends StatelessWidget {
  final String title;
  final String category;
  final String ingredientsCount;
  final String harmLevel;
  final Color harmColor;

  const _SampleProductCard({
    required this.title,
    required this.category,
    required this.ingredientsCount,
    required this.harmLevel,
    required this.harmColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF334155),
          child: Icon(Icons.shopping_bag_outlined, color: Colors.white70),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
        subtitle: Text('$category • $ingredientsCount', style: const TextStyle(color: Colors.white54, fontSize: 12)),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: harmColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            harmLevel,
            style: TextStyle(color: harmColor, fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// 2. SCANNER & ANALYSIS SCREEN (3 MODES)
// ------------------------------------------------------------------

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

  Future<void> _performImagePickerScan() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
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
    return Scaffold(
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
                        'Extracts ingredient text automatically using Tesseract OCR',
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
                  color: Colors.red.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
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
                            color: getHarmColor(_scanResult!['overall_harm_level']).withOpacity(0.2),
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
                        backgroundColor: getHarmColor(harm).withOpacity(0.2),
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
    );
  }
}

// ------------------------------------------------------------------
// 3. INGREDIENT SAFETY LIBRARY SCREEN
// ------------------------------------------------------------------

class IngredientLibraryScreen extends StatelessWidget {
  const IngredientLibraryScreen({super.key});

  final List<Map<String, String>> _ingredients = const [
    {
      'name': 'Triclosan',
      'category': 'Cosmetics / Toothpaste',
      'harm': 'Critical',
      'desc': 'Endocrine disruptor. Restricted by EU & US FDA due to thyroid disruption and antibiotic resistance risks.',
      'reg': 'Restricted by FSSAI & CDSCO'
    },
    {
      'name': 'Methylparaben',
      'category': 'Cosmetic Preservative',
      'harm': 'High',
      'desc': 'Synthetic preservative mimicking estrogen. Linked to skin irritation and endocrine concerns.',
      'reg': 'Regulated limit 0.4% in India'
    },
    {
      'name': 'Monosodium Glutamate (INS 621)',
      'category': 'Food Flavour Enhancer',
      'harm': 'Moderate',
      'desc': 'Excitotoxin. May cause headaches, flushing, and sweating in sensitive individuals.',
      'reg': 'FSSAI warning mandatory for infants'
    },
    {
      'name': 'Tartrazine (INS 102)',
      'category': 'Artificial Food Dye',
      'harm': 'High',
      'desc': 'Synthetic azo dye. Associated with hyperkinesis in children and allergic asthma.',
      'reg': 'Requires warning label in EU & India'
    },
    {
      'name': 'Sodium Lauryl Sulfate (SLS)',
      'category': 'Surfactant / Foaming Agent',
      'harm': 'Moderate',
      'desc': 'Strong detergent. Can cause mucosal irritation, aphthous ulcers, and skin dryness.',
      'reg': 'BIS permitted with rinse-off limits'
    },
    {
      'name': 'Niacinamide (Vitamin B3)',
      'category': 'Skincare Active',
      'harm': 'Safe',
      'desc': 'Safe anti-inflammatory skin nutrient. Improves lipid barrier and hyperpigmentation.',
      'reg': 'Approved by CDSCO & US FDA'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text('Ingredient Safety Directory', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _ingredients.length,
        itemBuilder: (context, index) {
          final item = _ingredients[index];
          final color = getHarmColor(item['harm']);

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Text(
                  item['name']![0],
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                item['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Text(
                'Category: ${item['category']}',
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item['harm']!,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['desc']!, style: const TextStyle(color: Color(0xE6FFFFFF), fontSize: 13)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.verified, size: 16, color: Color(0xFF818CF8)),
                          const SizedBox(width: 6),
                          Text(item['reg']!, style: const TextStyle(color: Color(0xFF818CF8), fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------------
// 4. REGULATORY GUIDE SCREEN
// ------------------------------------------------------------------

class RegulatoryGuideScreen extends StatelessWidget {
  const RegulatoryGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text('Indian Regulatory Standards', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAuthorityCard(
              code: 'FSSAI',
              name: 'Food Safety and Standards Authority of India',
              role: 'Regulates food additives, INS numbers, & dietary safety limits.',
              color: const Color(0xFF10B981),
            ),
            const SizedBox(height: 12),
            _buildAuthorityCard(
              code: 'CDSCO',
              name: 'Central Drugs Standard Control Organisation',
              role: 'Controls cosmetics, drugs, & personal care ingredients in India.',
              color: const Color(0xFF6366F1),
            ),
            const SizedBox(height: 12),
            _buildAuthorityCard(
              code: 'BIS',
              name: 'Bureau of Indian Standards',
              role: 'Establishes quality standards for Indian household products & soaps.',
              color: const Color(0xFFF59E0B),
            ),
            const SizedBox(height: 12),
            _buildAuthorityCard(
              code: 'EU ECHA',
              name: 'European Chemicals Agency / WHO',
              role: 'Global toxicology benchmark for banned carcinogens & disruptors.',
              color: const Color(0xFFEC4899),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthorityCard({
    required String code,
    required String name,
    required String role,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                code,
                style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                  const SizedBox(height: 6),
                  Text(role, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
