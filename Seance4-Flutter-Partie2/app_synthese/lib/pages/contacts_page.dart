import 'package:flutter/material.dart';
import 'package:app_synthese/models/contact.dart';

// Page Contacts — liste + ajout (CRUD en mémoire).
// @author Wafaa Boukchouch - MII BDCC ENSET
class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contact> _contacts = List.of(contactsParDefaut);
  final _nomCtrl   = TextEditingController();
  final _telCtrl   = TextEditingController();

  void _ajouterContact() {
    if (_nomCtrl.text.trim().isEmpty || _telCtrl.text.trim().isEmpty) return;
    setState(() {
      _contacts.add(Contact(_nomCtrl.text.trim(), _telCtrl.text.trim()));
      _nomCtrl.clear();
      _telCtrl.clear();
    });
  }

  void _supprimerContact(int index) {
    setState(() => _contacts.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contacts (${_contacts.length})')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nomCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Nom', prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _telCtrl,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Téléphone', prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton.small(
                  onPressed: _ajouterContact,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (ctx, i) {
                final c = _contacts[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF006B5E),
                    child: Text(
                      c.nom[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(c.nom, style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(c.telephone),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _supprimerContact(i),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
