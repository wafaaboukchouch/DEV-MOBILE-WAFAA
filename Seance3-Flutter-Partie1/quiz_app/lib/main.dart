import 'package:flutter/material.dart';
import 'quiz.dart';
import 'weather.dart';

// Point d'entrée — Application Quiz + Météo
// @author Wafaa Boukchouch - MII BDCC ENSET
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz & Météo — Wafaa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            title: const Text('Quiz & Météo'),
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.quiz), text: 'Quiz'),
                Tab(icon: Icon(Icons.cloud), text: 'Météo'),
              ],
            ),
          ),
          body: const TabBarView(children: [Quiz(), Weather()]),
        ),
      ),
    );
  }
}
