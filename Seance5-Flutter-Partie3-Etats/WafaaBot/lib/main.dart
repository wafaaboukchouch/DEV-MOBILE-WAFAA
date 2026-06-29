import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/chat_screen.dart';

// WafaaBot — Chatbot IA multiplateforme utilisant l'API Groq (LLaMA).
// @author Wafaa Boukchouch - MII BDCC ENSET
Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const WafaaBotApp());
}

class WafaaBotApp extends StatelessWidget {
  const WafaaBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WafaaBot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006B5E)),
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}
