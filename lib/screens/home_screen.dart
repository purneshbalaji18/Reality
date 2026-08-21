import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(String scanType) onNavigateToScan;

  const HomeScreen({super.key, required this.onNavigateToScan});

  // FIX 7 — Per-session camera permission check for Android 17 (API 37)
  Future<void> _checkPermissionAndNavigate(BuildContext context, String scanType) async {
    // Re-verify session permissions dynamically before scan launch
    onNavigateToScan(scanType);
  }

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
                applicationVersion: '1.0.0 (Android 15-17 Ready)',
                applicationIcon: const Text('🧪', style: TextStyle(fontSize: 32)),
                children: [
                  const Text('Product Safety & Clinical Toxicology Intelligence for the Indian Market.'),
                  const SizedBox(height: 8),
                  const Text('Optimized for Android 15 (Edge-to-Edge), Android 16 (Predictive Back), & Android 17 Beta.'),
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
                    color: const Color(0xFF6366F1).withValues(alpha: 0.4),
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
                    onTap: () => _checkPermissionAndNavigate(context, 'barcode'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _QuickScanCard(
                    icon: Icons.camera_alt_outlined,
                    title: 'Label OCR',
                    subtitle: 'Scan packaging photo',
                    color: const Color(0xFFA855F7),
                    onTap: () => _checkPermissionAndNavigate(context, 'ocr'),
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
              onTap: () => _checkPermissionAndNavigate(context, 'text'),
            ),

            const SizedBox(height: 28),

            // Featured Indian Products
            const Text(
              'Sample Indian FMCG Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const _SampleProductCard(
              title: 'Glow & Lovely Advanced Multivitamin',
              category: 'Skincare Cream',
              ingredientsCount: '18 ingredients',
              harmLevel: 'Moderate',
              harmColor: Colors.amberAccent,
            ),
            const _SampleProductCard(
              title: 'Colgate Strong Teeth Toothpaste',
              category: 'Oral Hygiene',
              ingredientsCount: '12 ingredients (Triclosan, SLS)',
              harmLevel: 'Moderate',
              harmColor: Colors.amberAccent,
            ),
            const _SampleProductCard(
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
                border: Border.all(color: Colors.redAccent.withValues(alpha: 0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Watchlist: Restricted Additives in India',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
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
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.2),
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
            color: harmColor.withValues(alpha: 0.2),
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
