import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'weather_service.dart';

// Onglet Météo : saisie d'une ville → géocodage → prévisions horaires (Open-Meteo).
// @author Wafaa Boukchouch - MII BDCC ENSET
class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final _cityController = TextEditingController();
  List<dynamic>? _times;
  List<dynamic>? _temps;
  String? _cityName;
  String? _error;
  bool _loading = false;

  Future<void> _getData(String city) async {
    setState(() { _loading = true; _error = null; _times = null; _temps = null; });
    try {
      final place = await geocodeCity(city);
      if (place == null) {
        setState(() { _loading = false; _error = 'Ville introuvable'; });
        return;
      }
      final forecast = await fetchHourlyForecast(place['latitude'], place['longitude']);
      setState(() {
        _loading = false;
        _cityName = place['name'];
        _times = forecast['time'];
        _temps = forecast['temperature_2m'];
      });
    } catch (e) {
      setState(() { _loading = false; _error = 'Erreur de connexion'; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      hintText: 'Entrer une ville...',
                      prefixIcon: Icon(Icons.location_city, color: Colors.teal),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: _getData,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, foregroundColor: Colors.white),
                  onPressed: () => _getData(_cityController.text),
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          if (_loading) const CircularProgressIndicator(color: Colors.teal),
          if (_error != null)
            Text(_error!, style: const TextStyle(color: Colors.red, fontSize: 16)),
          if (_cityName != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(_cityName!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
            ),
          if (_times != null)
            Expanded(
              child: ListView.builder(
                itemCount: _times!.length,
                itemBuilder: (ctx, i) {
                  final dt = DateTime.parse(_times![i]);
                  return Card(
                    color: Colors.teal.shade50,
                    child: ListTile(
                      leading: const Icon(Icons.thermostat, color: Colors.teal),
                      title: Text(DateFormat('EEE dd/MM HH:mm', 'fr_FR').format(dt)),
                      trailing: Text(
                        '${_temps![i]} °C',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                      ),
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
