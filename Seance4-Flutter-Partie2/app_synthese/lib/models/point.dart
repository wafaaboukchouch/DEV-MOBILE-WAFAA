import 'dart:math' as math;

// Modèle Point 2D — constructeurs nommés, factory, opérateurs.
// @author Wafaa Boukchouch - MII BDCC ENSET
class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);
  const Point.origin() : x = 0, y = 0;

  factory Point.from(List<double> data) => Point(data[0], data[1]);

  Point.fromJson(Map<String, dynamic> data)
      : x = (data['x'] as num).toDouble(),
        y = (data['y'] as num).toDouble();

  Map<String, dynamic> toJson() => {'x': x, 'y': y};

  void affiche() => print("Point($x, $y)");

  @override
  String toString() => "Point($x, $y)";

  double distanceTo(Point p) {
    final dx = x - p.x, dy = y - p.y;
    return math.sqrt(dx * dx + dy * dy);
  }

  Point operator +(Point p) => Point(x + p.x, y + p.y);
}
