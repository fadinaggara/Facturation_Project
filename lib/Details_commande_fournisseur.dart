import 'package:flutter/material.dart';

class Details_command_fournisseur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commande Fournisseur',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Commande Fournisseur'),
          backgroundColor: Color(0xFFFF5400),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'Commande Fournisseur',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text('Référence de commande: 123456'),
              SizedBox(height: 30),
              Text('Destination de commande: Paris, France'),
              SizedBox(height: 30),
              Text('Quantité: 10'),
              SizedBox(height: 30),
              Text('Prix unitaire: 20 €'),
              SizedBox(height: 30),
              Text('Remise: 5%'),
              SizedBox(height: 30),
              Text('Montant: 190 €'),
              SizedBox(height: 30),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total hors taxe: 100 €',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total FODAC: 10 €',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total TVA: 21 €',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total timbre: 1 €',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total TTC: 132 €',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Ajouter le code pour confirmer la commande ici
                  },
                  child: Text('Confirmer la commande'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFFF5400)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
