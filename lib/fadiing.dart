import 'package:flutter/material.dart';

class MonInterface extends StatefulWidget {
  const MonInterface({Key? key}) : super(key: key);

  @override
  _MonInterfaceState createState() => _MonInterfaceState();
}

class _MonInterfaceState extends State<MonInterface> {
  bool isDarkModeEnabled = false;

  bool estModeNuit = false;
  bool estAllume = false;
  double niveauEau = 0.0;
  double temperature = 25.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Interface'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/feu.jpg',
              height: 200.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Température : ${temperature.toString()}°C',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Allumé'),
                Switch(
                  value: estAllume,
                  onChanged: (value) {
                    setState(() {
                      estAllume = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mode Nuit'),
                Switch(
                  value: isDarkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      isDarkModeEnabled = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Niveau d\'eau : ${niveauEau.toString()}%',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Slider(
              value: niveauEau,
              min: 0.0,
              max: 100.0,
              onChanged: (value) {
                setState(() {
                  niveauEau = value;
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: isDarkModeEnabled ? Colors.black : Colors.white,
    );
  }
}
