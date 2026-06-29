import 'package:flutter/material.dart';
import 'package:app_synthese/models/tic_tac_toe.dart';

// Page Morpion — reçoit le nom du joueur via constructeur (Navigation).
// @author Wafaa Boukchouch - MII BDCC ENSET
class TicTacToePage extends StatefulWidget {
  final String joueur;

  const TicTacToePage({super.key, required this.joueur});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  final _game = TicTacToe();

  @override
  Widget build(BuildContext context) {
    final gagnant = _game.winner();
    return Scaffold(
      appBar: AppBar(title: Text('Morpion — ${widget.joueur}')),
      body: Column(
        children: [
          const SizedBox(height: 16),
          if (gagnant != null)
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF006B5E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '🎉 Gagnant : $gagnant',
                style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          else if (_game.isFull)
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Match nul !', style: TextStyle(fontSize: 22, color: Colors.white)),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8,
                ),
                itemCount: 9,
                itemBuilder: (ctx, i) => GestureDetector(
                  onTap: () => setState(() => _game.play(i)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _game.cells[i] == 'X'
                          ? const Color(0xFF006B5E).withOpacity(0.15)
                          : _game.cells[i] == 'O'
                              ? Colors.orange.withOpacity(0.15)
                              : Colors.grey.shade100,
                      border: Border.all(color: const Color(0xFF006B5E), width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        _game.cells[i],
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: _game.cells[i] == 'X' ? const Color(0xFF006B5E) : Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('Recommencer'),
                onPressed: () => setState(() => _game.reset()),
              ),
              TextButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Retour'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
