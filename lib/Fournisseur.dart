import 'package:flutter/material.dart';
import 'package:last/consultation_commandes.dart';
import 'package:last/facture_fournisseur.dart';
import 'package:last/valid_command_fournisseur.dart';


class Fournisseur extends StatelessWidget {
  const Fournisseur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Services fournisseur'),
          backgroundColor: const Color(0xFFFF5400),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ValideCommandeFournisseur(),
                    ),
                  );
                },
                child: Column(
                  children: const [
                    Image(
                      width: 150,
                      height: 150,
                      image: AssetImage("assets/images/valid commande.png"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Valider une commande',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FactureListFournisseur(),
                    ),
                  );
                },
                child: Column(
                  children: const [
                    Image(
                      width: 150,
                      height: 150,
                      image: AssetImage("assets/images/facture.png"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Liste des factures',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConsultationCommandes(),
                    ),
                  );
                },
                child: Column(
                  children: const [
                    Image(
                      width: 150,
                      height: 150,
                      image: AssetImage("assets/images/consulter commande.png"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Consulter les commandes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
