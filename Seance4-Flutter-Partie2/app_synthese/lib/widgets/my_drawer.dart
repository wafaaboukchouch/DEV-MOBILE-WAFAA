import 'package:flutter/material.dart';
import 'package:app_synthese/global/global_parameters.dart';
import 'package:app_synthese/widgets/drawer_header_widget.dart';
import 'package:app_synthese/widgets/drawer_item_widget.dart';

// Drawer principal de l'application.
// @author Wafaa Boukchouch - MII BDCC ENSET
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MyDrawerHeaderWidget(),
          Expanded(
            child: ListView.separated(
              itemCount: GlobalParameters.menus.length,
              separatorBuilder: (_, __) => const Divider(height: 1, color: Color(0xFFE0E0E0)),
              itemBuilder: (ctx, i) => DrawerItemWidget(
                GlobalParameters.menus[i]['title'],
                GlobalParameters.menus[i]['route'],
                GlobalParameters.menus[i]['icon'],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '© 2025 Wafaa Boukchouch\nMII BDCC — ENSET',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
