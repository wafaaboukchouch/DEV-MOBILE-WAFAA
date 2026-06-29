import 'package:flutter/material.dart';
import 'package:app_synthese/pages/contacts_page.dart';
import 'package:app_synthese/pages/counter_page.dart';
import 'package:app_synthese/pages/gallery_page.dart';
import 'package:app_synthese/pages/home_page.dart';
import 'package:app_synthese/pages/meteo_page.dart';
import 'package:app_synthese/pages/login_page.dart';

// Paramètres globaux : routes nommées + menus du Drawer.
// @author Wafaa Boukchouch - MII BDCC ENSET
class GlobalParameters {
  static final Map<String, WidgetBuilder> routes = {
    '/':          (context) => const HomePage(),
    '/counter':   (context) => const CounterPage(),
    '/contacts':  (context) => const ContactsPage(),
    '/meteo':     (context) => const MeteoPage(),
    '/gallery':   (context) => const GalleryPage(),
    '/login':     (context) => const LoginPage(),
  };

  static final List<Map<String, dynamic>> menus = [
    {'title': 'Accueil',   'route': '/',          'icon': const Icon(Icons.home)},
    {'title': 'Compteur',  'route': '/counter',   'icon': const Icon(Icons.memory)},
    {'title': 'Contacts',  'route': '/contacts',  'icon': const Icon(Icons.contacts)},
    {'title': 'Météo',     'route': '/meteo',     'icon': const Icon(Icons.cloud)},
    {'title': 'Galerie',   'route': '/gallery',   'icon': const Icon(Icons.photo_library)},
  ];
}
