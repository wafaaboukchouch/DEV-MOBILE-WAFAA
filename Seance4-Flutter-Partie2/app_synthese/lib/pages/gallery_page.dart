import 'package:flutter/material.dart';

// Page Galerie — grille de technologies Cloud & Big Data maîtrisées.
// @author Wafaa Boukchouch - MII BDCC ENSET
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  static const _items = [
    {'label': 'Azure',       'icon': Icons.cloud},
    {'label': 'Intune',      'icon': Icons.phone_android},
    {'label': 'Entra ID',    'icon': Icons.verified_user},
    {'label': 'Flutter',     'icon': Icons.flutter_dash},
    {'label': 'Spark',       'icon': Icons.bolt},
    {'label': 'LangChain',   'icon': Icons.psychology},
    {'label': 'Docker',      'icon': Icons.inventory_2},
    {'label': 'ServiceNow',  'icon': Icons.support_agent},
    {'label': 'Power BI',    'icon': Icons.bar_chart},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ma Stack Technologique')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12,
          ),
          itemCount: _items.length,
          itemBuilder: (ctx, i) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF006B5E).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF006B5E).withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_items[i]['icon'] as IconData, size: 36, color: const Color(0xFF006B5E)),
                  const SizedBox(height: 6),
                  Text(
                    _items[i]['label'] as String,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1A2340)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
