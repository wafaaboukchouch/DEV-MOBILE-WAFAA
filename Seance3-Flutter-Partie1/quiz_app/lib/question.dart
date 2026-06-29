import 'package:flutter/material.dart';

// Widget stateless affichant la question courante + sa progression.
// @author Wafaa Boukchouch - MII BDCC ENSET
class Question extends StatelessWidget {
  final String question;
  final int currentIndex;
  final int total;

  const Question(this.question, this.currentIndex, this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${currentIndex + 1} / $total',
          style: const TextStyle(fontSize: 20, color: Colors.teal),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(10),
          child: Text(
            question,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
