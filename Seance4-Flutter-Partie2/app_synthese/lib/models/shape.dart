import 'point.dart';

// Classe abstraite de base pour les formes géométriques.
// @author Wafaa Boukchouch - MII BDCC ENSET
abstract class Shape {
  final Point p1;
  final Point p2;

  const Shape({required this.p1, required this.p2});

  double getPerimeter();
  double getArea();
  Map<String, dynamic> toJson();
}
