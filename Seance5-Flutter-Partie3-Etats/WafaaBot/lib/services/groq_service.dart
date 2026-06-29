import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Service d'appel à l'API Groq (LLaMA 3.3 70B).
// @author Wafaa Boukchouch - MII BDCC ENSET
class GroqService {
  static const String _endpoint = 'https://api.groq.com/openai/v1/chat/completions';

  String get _apiKey => dotenv.env['GROQ_API_KEY'] ?? '';
  String get _model  => dotenv.env['GROQ_MODEL']   ?? 'llama-3.3-70b-versatile';

  // Prompt système personnalisé Wafaa
  static const _systemPrompt = '''
Tu es WafaaBot, un assistant IA intelligent et bienveillant créé par Wafaa Boukchouch,
étudiante en Master MII BDCC à l\'ENSET Mohammedia.
Tu réponds en français de manière claire, précise et pédagogique.
Tu es spécialisé en Cloud Computing (Azure), Big Data (Spark, Hadoop),
développement mobile (Flutter, Android) et intelligence artificielle (LangChain, RAG).
''';

  Future<String> envoyerMessage(List<Map<String, String>> historique) async {
    if (_apiKey.isEmpty || _apiKey == 'your_groq_api_key_here') {
      throw Exception('Clé API Groq manquante. Configure GROQ_API_KEY dans le fichier .env');
    }

    final messages = [
      {'role': 'system', 'content': _systemPrompt},
      ...historique,
    ];

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        'model': _model,
        'messages': messages,
        'temperature': 0.7,
        'max_tokens': 1024,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur API Groq (${response.statusCode}) : ${response.body}');
    }

    final data = jsonDecode(utf8.decode(response.bodyBytes));
    return data['choices'][0]['message']['content'].toString().trim();
  }
}
