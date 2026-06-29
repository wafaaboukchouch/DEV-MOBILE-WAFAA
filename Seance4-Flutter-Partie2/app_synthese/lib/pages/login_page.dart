import 'package:flutter/material.dart';
import 'package:app_synthese/pages/tic_tac_toe_page.dart';

// Page Connexion → redirige vers le Morpion avec le nom du joueur.
// @author Wafaa Boukchouch - MII BDCC ENSET
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginCtrl = TextEditingController();
  final _passCtrl  = TextEditingController();

  void _seConnecter() {
    final joueur = _loginCtrl.text.trim().isEmpty ? 'Joueur' : _loginCtrl.text.trim();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => TicTacToePage(joueur: joueur)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.lock_outline, size: 64, color: Color(0xFF006B5E)),
            const SizedBox(height: 24),
            TextField(
              controller: _loginCtrl,
              decoration: const InputDecoration(
                labelText: 'Identifiant',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _seConnecter,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: const Color(0xFF006B5E),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Se connecter', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
