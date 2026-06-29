import 'dart:math';
import 'shape.dart';
import 'point.dart';

// Cercle défini par centre (p1) et un point du bord (p2).
// @author Wafaa Boukchouch - MII BDCC ENSET
class Circle extends Shape {
  Circle({required Point p1, required Point p2}) : super(p1: p1, p2: p2);

  double getRadius() => p1.distanceTo(p2);

  @override
  double getArea() => pi * pow(getRadius(), 2);

  @override
  double getPerimeter() => 2 * pi * getRadius();

  @override
  Map<String, dynamic> toJson() => {
    'type': 'Circle',
    'centre': p1.toJson(),
    'rayon': getRadius(),
  };
}
