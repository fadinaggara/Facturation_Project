import 'package:flutter/material.dart';
import 'package:last/api/fournisseur_service.dart';
import 'package:last/detail1.dart';
import 'package:last/widgets/dimmer_loading.dart';


import 'models/Facture.dart';

class FactureListFournisseur extends StatefulWidget {
  const FactureListFournisseur({Key? key}) : super(key: key);

  @override
  State<FactureListFournisseur> createState() => _FactureListFournisseurState();
}

class _FactureListFournisseurState extends State<FactureListFournisseur> {
  bool _isLoading = true;

  List<Facture>? _commande = [];

  getAllCommande() async {
    setState(() {
      _isLoading = false;
    });
    _commande = await FournisseurService.getFacture();

    setState(() {
      _isLoading = false;
    });
    print(_commande);
  }

  @override
  void initState() {
    getAllCommande();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factures Fourniseurs'),
        backgroundColor: const Color(0xFFFF5400),
      ),
      body: _isLoading
          ? const FullScreenDimmer()
          : ListView.builder(
              itemCount: _commande!.length,
              itemBuilder: (BuildContext context, int index) {
                final facture = _commande![index];
                print(facture.toJson());
                return ListTile(
                    title: Text('Facture ${facture.reference}'),
                    subtitle: Text('Etat: ${facture.etat}'),
                    trailing: ElevatedButton(
                      onPressed: () {

                        // Add code to show details for this facture
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFFFF5400), // sets background color of button
                        foregroundColor:
                            Colors.white, // sets text color of button
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // sets rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10), // sets padding
                      ),
                      child: const Text('Details'),
                    ));
              },
            ),
    );
  }
}
