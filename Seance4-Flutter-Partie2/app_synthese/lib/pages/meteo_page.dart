import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_synthese/services/weather_service.dart';

// Page Météo — saisie ville → prévisions horaires (Open-Meteo).
// @author Wafaa Boukchouch - MII BDCC ENSET
class MeteoPage extends StatefulWidget {
  const MeteoPage({super.key});

  @override
  State<MeteoPage> createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  final _villeCtrl = TextEditingController();
  List<dynamic>? _horaires;
  List<dynamic>? _temperatures;
  String? _erreur;
  bool _loading = false;

  Future<void> _chargerMeteo(String ville) async {
    if (ville.trim().isEmpty) return;
    setState(() { _loading = true; _erreur = null; _horaires = null; _temperatures = null; });
    try {
      final place = await geocodeCity(ville);
      if (place == null) {
        setState(() { _loading = false; _erreur = 'Ville introuvable'; });
        return;
      }
      final forecast = await fetchHourlyForecast(place['latitude'], place['longitude']);
      setState(() {
        _loading = false;
        _horaires     = forecast['time'];
        _temperatures = forecast['temperature_2m'];
      });
    } catch (_) {
      setState(() { _loading = false; _erreur = 'Erreur de connexion'; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Météo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _villeCtrl,
                    decoration: const InputDecoration(
                      hintText: 'Entrer une ville...',
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: _chargerMeteo,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _chargerMeteo(_villeCtrl.text),
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          if (_loading) const CircularProgressIndicator(),
          if (_erreur != null)
            Text(_erreur!, style: const TextStyle(color: Colors.red, fontSize: 16)),
          if (_horaires != null)
            Expanded(
              child: ListView.builder(
                itemCount: _horaires!.length,
                itemBuilder: (ctx, i) {
                  final dt = DateTime.parse(_horaires![i]);
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: ListTile(
                      leading: const Icon(Icons.thermostat, color: Color(0xFF006B5E)),
                      title: Text(DateFormat('EEE dd/MM HH:mm').format(dt)),
                      trailing: Text(
                        '${_temperatures![i]} °C',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF006B5E)),
                      ),
                    ),
                  );
                },
              ),
            )
          else if (!_loading && _erreur == null)
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wb_sunny_outlined, size: 64, color: Colors.grey),
                    SizedBox(height: 12),
                    Text('Recherchez une ville...', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
