import 'package:flutter/material.dart';
import 'package:app_synthese/widgets/my_drawer.dart';

// Page d'accueil avec Drawer et présentation personnalisée.
// @author Wafaa Boukchouch - MII BDCC ENSET
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 80, color: Color(0xFF006B5E)),
            const SizedBox(height: 16),
            const Text(
              'Bienvenue Wafaa !',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF006B5E)),
            ),
            const SizedBox(height: 8),
            const Text(
              'MII BDCC — ENSET Mohammedia',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.gamepad),
              label: const Text('Démo Navigation → Morpion'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006B5E),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () => Navigator.pushNamed(context, '/login'),
            ),
          ],
        ),
      ),
    );
  }
}
