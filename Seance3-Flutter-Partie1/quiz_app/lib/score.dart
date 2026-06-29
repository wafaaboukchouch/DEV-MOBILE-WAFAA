import 'package:flutter/material.dart';

// Widget affichant le score final et proposant de recommencer.
// @author Wafaa Boukchouch - MII BDCC ENSET
class Score extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback resetQuiz;

  const Score(this.score, this.resetQuiz, this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    final pct = (score / total * 100).toStringAsFixed(0);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.emoji_events, size: 64, color: Colors.teal),
          const SizedBox(height: 16),
          Text(
            'Score : $score / $total  ($pct %)',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text('Recommencer', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
            onPressed: resetQuiz,
          ),
        ],
      ),
    );
  }
}
