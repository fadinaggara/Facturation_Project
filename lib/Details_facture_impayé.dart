import 'package:flutter/material.dart';

class DetailFactureImpayeePage extends StatelessWidget {
  final String numeroFacture;
  final String client;
  final double montantTotal;
  final double montantImpaye;
  final String dateEcheance;

  DetailFactureImpayeePage({
    required this.numeroFacture,
    required this.client,
    required this.montantTotal,
    required this.montantImpaye,
    required this.dateEcheance,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détail de facture impayée'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Numéro de facture: $numeroFacture',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Client: $client',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Montant total: $montantTotal',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Montant impayé: $montantImpaye',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Date d\'échéance: $dateEcheance',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Ajoutez ici votre logique pour permettre au client de payer la facture.
              // Par exemple, vous pouvez lancer un navigateur Web pour afficher une page de paiement.
            },
            child: Text('Payer la facture'),
          ),
        ],
      ),
    );
  }
}
