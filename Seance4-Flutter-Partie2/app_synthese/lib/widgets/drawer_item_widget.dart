import 'package:flutter/material.dart';

// Item du Drawer : icône + titre + flèche de navigation.
// @author Wafaa Boukchouch - MII BDCC ENSET
class DrawerItemWidget extends StatelessWidget {
  final String titre;
  final String route;
  final Icon icone;

  const DrawerItemWidget(this.titre, this.route, this.icone, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icone,
      trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF006B5E), size: 16),
      title: Text(
        titre,
        style: const TextStyle(fontSize: 16, color: Color(0xFF1A2340)),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
