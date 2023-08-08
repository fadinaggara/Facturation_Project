import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:last/models/Livraison.dart';

class DetailBonLivraison extends StatefulWidget {
  Livraison livraison;
  DetailBonLivraison({required this.livraison});
  @override
  State<DetailBonLivraison> createState() => _Detail_bon_BvrLsonState();
}

class _Detail_bon_BvrLsonState extends State<DetailBonLivraison> {
  @override
  void initState() {
    print(widget.livraison);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail de bon de livraison'),
        backgroundColor: const Color(0xFFFF5400),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                'Titre de bon de livraison',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
                'Référence de commande: ${widget.livraison.commande!.reference}'),
            const SizedBox(height: 30),
            Text(
                'Destination de commande: ${widget.livraison.commande!.distination}'),
            const SizedBox(height: 30),
            Text('Quantité: ${widget.livraison.commande!.quantit}'),
            const SizedBox(height: 30),
            Text(
                'Prix unitaire: ${widget.livraison.commande!.article![0].prixUnitaire}'),
            const SizedBox(height: 30),
            Text('Remise: ${widget.livraison.commande!.remise}%'),
            const SizedBox(height: 30),
            Text('Montant: ${widget.livraison.commande!.totalTtc} DT'),
            const SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total hors taxe: ${widget.livraison.commande!.totalHorsTaxe} DT',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total FODAC: ${widget.livraison.commande!.totalFodac} DT',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total TVA: ${widget.livraison.commande!.totalTva} DT',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total timbre: ${widget.livraison.commande!.totalTimbre} DT',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total TTC: ${widget.livraison.commande!.totalTtc} DT',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
