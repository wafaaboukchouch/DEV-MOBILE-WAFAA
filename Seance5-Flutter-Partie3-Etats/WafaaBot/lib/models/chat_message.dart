// Modèle d'un message dans la conversation.
// @author Wafaa Boukchouch - MII BDCC ENSET
enum MessageSender { utilisateur, bot }

class ChatMessage {
  final String texte;
  final MessageSender expediteur;
  final DateTime horodatage;

  ChatMessage({
    required this.texte,
    required this.expediteur,
    DateTime? horodatage,
  }) : horodatage = horodatage ?? DateTime.now();

  bool get estUtilisateur => expediteur == MessageSender.utilisateur;
}
