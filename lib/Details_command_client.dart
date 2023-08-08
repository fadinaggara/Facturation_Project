import 'package:flutter/material.dart';
import 'package:last/models/Livraison.dart';
import 'package:last/valid_command_client.dart';

import 'models/Facture.dart';

class command_client extends StatefulWidget {
  Livraison idd;

  command_client({required this.idd});

  @override
  State<command_client> createState() => _command_clientState();
}

class _command_clientState extends State<command_client> {
  List<Livraison>? _listOfBonLivraison = [];
  void initState() {
    print(widget.idd);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Commande Client'),
        backgroundColor: Color(0xFFFF5400),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Commande Client',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),

              ),
            ),
            SizedBox(height: 30),
            Text('Référence de commande: ${widget.idd?.commande?.reference ?? "c"}'),
            SizedBox(height: 30),
            Text('Destination de commande: ${widget.idd?.commande?.distination ?? "c"}'),
            SizedBox(height: 30),
            Text('Quantité: ${widget.idd?.commande?.quantit ?? "c"}'),
            SizedBox(height: 30),
            Text('Prix unitaire: 20 DT'),
            SizedBox(height: 30),
            Text('Remise: ${widget.idd?.commande?.remise ?? "c"}%'),
            SizedBox(height: 30),
            Text('Montant: ${widget.idd?.commande?.totalTtc ?? "c"} DT'),
            SizedBox(height: 30),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total hors taxe: ${widget.idd?.commande?.totalHorsTaxe ?? "c"} DT',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total FODAC: ${widget.idd?.commande?.totalFodac ?? "c"} DT',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total TVA: ${widget.idd?.commande?.totalTva ?? "c"} DT',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total timbre: ${widget.idd?.commande?.totalTimbre ?? "c"} DT',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total TTC: ${widget.idd?.commande?.totalTtc ?? "c"} DT',
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ValidCommandeClients()));
                },
                child: Text('Confirmer la commande'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF5400)),
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
    );
  }
}
