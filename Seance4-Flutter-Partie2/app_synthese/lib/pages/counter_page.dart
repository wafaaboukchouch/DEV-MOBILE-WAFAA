import 'package:flutter/material.dart';

// Page Compteur — incrémenter / décrémenter avec setState.
// @author Wafaa Boukchouch - MII BDCC ENSET
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _compteur = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compteur')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Valeur du compteur', style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 12),
            Text(
              '$_compteur',
              style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Color(0xFF006B5E)),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'dec',
            onPressed: () => setState(() => _compteur--),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'inc',
            onPressed: () => setState(() => _compteur++),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
