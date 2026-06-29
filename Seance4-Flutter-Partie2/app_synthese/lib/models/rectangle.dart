import 'point.dart';
import 'shape.dart';

// Rectangle défini par deux coins opposés.
// @author Wafaa Boukchouch - MII BDCC ENSET
class Rectangle extends Shape {
  Rectangle({required Point p1, required Point p2}) : super(p1: p1, p2: p2);

  double getLargeur() => (p1.x - p2.x).abs();
  double getHauteur() => (p1.y - p2.y).abs();

  @override
  double getArea() => getLargeur() * getHauteur();

  @override
  double getPerimeter() => 2 * (getLargeur() + getHauteur());

  @override
  Map<String, dynamic> toJson() => {
    'type': 'Rectangle',
    'x': p1.x, 'y': p1.y,
    'largeur': getLargeur(),
    'hauteur': getHauteur(),
  };
}

// Version simple (longueur/largeur entiers).
class RectangleSimple {
  int longueur;
  int largeur;

  RectangleSimple(this.longueur, this.largeur);

  int surface()   => longueur * largeur;
  int perimetre() => 2 * (longueur + largeur);
}
