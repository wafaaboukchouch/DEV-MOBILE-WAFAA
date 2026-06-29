import 'package:flutter/material.dart';

// Widget stateless représentant un bouton de réponse.
// @author Wafaa Boukchouch - MII BDCC ENSET
class Answer extends StatelessWidget {
  final Map<String, Object> answer;
  final Function handleAnswer;

  const Answer(this.answer, this.handleAnswer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            answer['answer'] as String,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        onPressed: () => handleAnswer(answer),
      ),
    );
  }
}
