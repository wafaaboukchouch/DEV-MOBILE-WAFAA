import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';
import 'score.dart';

// Widget principal du quiz — gère l'état (question courante + score).
// Questions thématiques Cloud & IT — personnalisation Wafaa Boukchouch.
// @author Wafaa Boukchouch - MII BDCC ENSET
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _currentIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'Quel service Azure est utilisé pour gérer les identités et les accès ?',
      'answers': [
        {'answer': 'A - Azure Active Directory (Entra ID)', 'correct': true},
        {'answer': 'B - Azure DevOps', 'correct': false},
        {'answer': 'C - Azure Kubernetes Service', 'correct': false},
        {'answer': 'D - Azure Monitor', 'correct': false},
      ],
    },
    {
      'question': 'Quel outil Microsoft permet la gestion des appareils mobiles (MDM) ?',
      'answers': [
        {'answer': 'A - Microsoft Intune', 'correct': true},
        {'answer': 'B - Microsoft Teams', 'correct': false},
        {'answer': 'C - SharePoint Online', 'correct': false},
        {'answer': 'D - Power BI', 'correct': false},
      ],
    },
    {
      'question': 'Dans Hadoop, quel composant est responsable du stockage distribué ?',
      'answers': [
        {'answer': 'A - YARN', 'correct': false},
        {'answer': 'B - MapReduce', 'correct': false},
        {'answer': 'C - HDFS', 'correct': true},
        {'answer': 'D - Hive', 'correct': false},
      ],
    },
    {
      'question': 'LangChain est principalement utilisé pour :',
      'answers': [
        {'answer': 'A - Le traitement d\'images médicales', 'correct': false},
        {'answer': 'B - La création d\'applications basées sur des LLMs', 'correct': true},
        {'answer': 'C - La gestion de bases de données relationnelles', 'correct': false},
        {'answer': 'D - Le déploiement de conteneurs Docker', 'correct': false},
      ],
    },
  ];

  void _handleAnswer(Map<String, Object> answer) {
    setState(() {
      if (answer['correct'] == true) _score++;
      _currentIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex >= _questions.length) {
      return Score(_score, _resetQuiz, _questions.length);
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Question(
            _questions[_currentIndex]['question'] as String,
            _currentIndex,
            _questions.length,
          ),
          ...(_questions[_currentIndex]['answers'] as List<Map<String, Object>>)
              .map((a) => Answer(a, _handleAnswer)),
        ],
      ),
    );
  }
}
