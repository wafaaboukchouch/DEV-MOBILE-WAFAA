import 'package:flutter/material.dart';

// En-tête du Drawer avec avatar et nom personnalisés Wafaa Boukchouch.
// @author Wafaa Boukchouch - MII BDCC ENSET
class MyDrawerHeaderWidget extends StatelessWidget {
  const MyDrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF006B5E), Color(0xFF00A896)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFF006B5E), size: 36),
          ),
          const SizedBox(height: 10),
          const Text(
            'Wafaa Boukchouch',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            'MII BDCC — ENSET Mohammedia',
            style: TextStyle(color: Color(0xCCFFFFFF), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
