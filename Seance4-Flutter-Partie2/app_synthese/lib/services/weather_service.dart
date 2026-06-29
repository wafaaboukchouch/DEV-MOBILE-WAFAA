import 'dart:convert';
import 'package:http/http.dart' as http;

// Service météo Open-Meteo (gratuit, sans clé API).
// @author Wafaa Boukchouch - MII BDCC ENSET
Future<Map<String, dynamic>?> geocodeCity(String city) async {
  final url = 'https://geocoding-api.open-meteo.com/v1/search?name=${Uri.encodeQueryComponent(city)}&count=1';
  final resp = await http.get(Uri.parse(url));
  final data = json.decode(resp.body);
  if (data['results'] == null || data['results'].isEmpty) return null;
  return data['results'][0];
}

Future<Map<String, List<dynamic>>> fetchHourlyForecast(double lat, double lon) async {
  final url = 'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m&forecast_days=2';
  final resp = await http.get(Uri.parse(url));
  final data = json.decode(resp.body);
  return {
    'time': data['hourly']['time'],
    'temperature_2m': data['hourly']['temperature_2m'],
  };
}
