import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../services/groq_service.dart';
import '../widgets/chat_bubble.dart';

// Écran principal du chatbot WafaaBot.
// Gestion d'état avec setState — historique de conversation.
// @author Wafaa Boukchouch - MII BDCC ENSET
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GroqService _groqService = GroqService();
  bool _isLoading = false;

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _envoyerMessage() async {
    final texte = _controller.text.trim();
    if (texte.isEmpty || _isLoading) return;

    setState(() {
      _messages.add(ChatMessage(texte: texte, expediteur: MessageSender.utilisateur));
      _isLoading = true;
    });
    _controller.clear();
    _scrollToBottom();

    try {
      final historique = _messages
          .map((m) => {
                'role': m.estUtilisateur ? 'user' : 'assistant',
                'content': m.texte,
              })
          .toList();

      final reponse = await _groqService.envoyerMessage(historique);

      setState(() {
        _messages.add(ChatMessage(texte: reponse, expediteur: MessageSender.bot));
      });
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage(
          texte: '⚠️ Erreur : ${e.toString()}',
          expediteur: MessageSender.bot,
        ));
      });
    } finally {
      setState(() => _isLoading = false);
      _scrollToBottom();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: Text('W', style: TextStyle(color: Color(0xFF006B5E), fontWeight: FontWeight.bold)),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WafaaBot', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Propulsé par Groq · LLaMA 3.3', style: TextStyle(fontSize: 11)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Effacer la conversation',
            onPressed: () => setState(() => _messages.clear()),
          ),
        ],
      ),
      body: Column(
        children: [
          // Message de bienvenue si vide
          if (_messages.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xFF006B5E),
                      child: Text('W', style: TextStyle(fontSize: 48, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20),
                    const Text('Bonjour ! Je suis WafaaBot 👋',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF006B5E))),
                    const SizedBox(height: 8),
                    const Text('Posez-moi vos questions en Cloud,\nBig Data, Flutter ou IA !',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                    const SizedBox(height: 24),
                    // Suggestions
                    Wrap(
                      spacing: 8, runSpacing: 8,
                      children: [
                        'C\'est quoi Azure Entra ID ?',
                        'Explique Flutter vs React Native',
                        'Qu\'est-ce que LangChain ?',
                        'Comment fonctionne HDFS ?',
                      ].map((s) => ActionChip(
                        label: Text(s, style: const TextStyle(fontSize: 12)),
                        backgroundColor: const Color(0xFF006B5E).withOpacity(0.1),
                        onPressed: () {
                          _controller.text = s;
                          _envoyerMessage();
                        },
                      )).toList(),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _messages.length,
                itemBuilder: (ctx, i) => ChatBubble(message: _messages[i]),
              ),
            ),

          // Indicateur de chargement
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  SizedBox(width: 38),
                  SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF006B5E))),
                  SizedBox(width: 10),
                  Text('WafaaBot réfléchit...', style: TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ),

          // Zone de saisie
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _envoyerMessage(),
                      decoration: InputDecoration(
                        hintText: 'Posez votre question...',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: const Color(0xFF006B5E),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _envoyerMessage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
