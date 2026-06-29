// Modèle Contact — nom + téléphone.
// @author Wafaa Boukchouch - MII BDCC ENSET
class Contact {
  final String nom;
  final String telephone;

  const Contact(this.nom, this.telephone);
}

// Contacts par défaut (thème IT/Cloud)
const List<Contact> contactsParDefaut = [
  Contact('Wafaa Boukchouch', '0600000001'),
  Contact('Admin Azure',      '0600000002'),
  Contact('Support Intune',   '0600000003'),
  Contact('Équipe DevOps',    '0600000004'),
];
