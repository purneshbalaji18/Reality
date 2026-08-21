import 'package:flutter/material.dart';

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

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> scanResult;

  const ResultScreen({super.key, required this.scanResult});

  @override
  Widget build(BuildContext context) {
    final overallHarm = scanResult['overall_harm_level'] ?? 'UNKNOWN';
    final summary = scanResult['toxicology_summary']?['clinical_explanation'] ?? 'Analysis complete.';
    final ingredients = (scanResult['ingredients'] as List?) ?? [];

    // FIX 4 — PopScope predictive back gesture support for Android 16
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        // Allows predictive back navigation to home screen
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F172A),
          title: const Text('Toxicology Audit Result', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // FIX 3 — Large screen / Foldable (Galaxy Z Fold, Tablets) adaptive layout
              if (constraints.maxWidth > 600) {
                // Two-Column Layout for Foldables & Tablets
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column: Verdict Card
                      Expanded(
                        flex: 5,
                        child: SingleChildScrollView(
                          child: _buildVerdictCard(overallHarm, summary, scanResult),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Right Column: Ingredient Breakdown List
                      Expanded(
                        flex: 7,
                        child: SingleChildScrollView(
                          child: _buildIngredientList(ingredients),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                // Single-Column Layout for Standard Phones
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildVerdictCard(overallHarm, summary, scanResult),
                      const SizedBox(height: 20),
                      _buildIngredientList(ingredients),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildVerdictCard(String overallHarm, String summary, Map<String, dynamic> data) {
    final color = getHarmColor(overallHarm);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data['product'] != null) ...[
            Text(
              data['product']['name'] ?? 'FMCG Product',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              'Brand: ${data['product']['brand'] ?? 'N/A'}',
              style: const TextStyle(color: Colors.white54, fontSize: 13),
            ),
            const Divider(color: Colors.white12, height: 24),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Overall Harm Rating:', style: TextStyle(color: Colors.white70, fontSize: 14)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  overallHarm.toUpperCase(),
                  style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            summary,
            style: const TextStyle(color: Color(0xE6FFFFFF), fontSize: 13, height: 1.45),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientList(List ingredients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredient Breakdown (${ingredients.length} items)',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            final ing = ingredients[index];
            final name = ing['raw_name'] ?? ing['canonical_name'] ?? 'Compound';
            final harm = ing['harm_level'] ?? 'safe';
            final isResolved = ing['is_resolved'] ?? false;
            final color = getHarmColor(harm);

            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: color.withValues(alpha: 0.2),
                  child: Icon(
                    isResolved ? Icons.shield_outlined : Icons.help_outline,
                    color: color,
                  ),
                ),
                title: Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: Text(
                  isResolved ? 'Resolved in toxicology database' : 'Unresolved compound',
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                trailing: Text(
                  harm.toString().toUpperCase(),
                  style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
