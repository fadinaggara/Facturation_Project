import 'package:flutter/material.dart';
import 'package:last/consultation_commandes.dart';
import 'package:last/facture_Client.dart';
import 'package:last/valid_command_client.dart';
import 'package:last/widgets/factures_clients_reglement.dart';

class Client extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Services client'),
          backgroundColor: const Color(0xFFFF5400),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ValidCommandeClients()));
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Image(
                width: 185,
                height: 185,
                image: AssetImage("assets/images/valid commande.png"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 17),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FactReg()));
            },
            child: const Center(
              child: Image(
                width: 185,
                height: 185,
                image: AssetImage("assets/images/facture.png"),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 17),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConsultationCommandes()));
            },
            child: const Center(
              //padding: EdgeInsets.fromLTRB(10, 50,80, 0),
              child: Image(
                width: 185,
                height: 185,
                image: AssetImage("assets/images/consulter commande.png"),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ])));
  }
}

/*Image(
                          width: 150,
                          height: 150,
                          image: AssetImage("assets/images/1.png"),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'bons de livraison',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),*/
