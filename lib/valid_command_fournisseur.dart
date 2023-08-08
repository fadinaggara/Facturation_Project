import 'package:flutter/material.dart';
import 'package:last/Details_commande_fournisseur.dart';
import 'package:last/api/fournisseur_service.dart';
import 'package:last/widgets/dimmer_loading.dart';

import 'models/Facture.dart';

class ValideCommandeFournisseur extends StatefulWidget {
  @override
  ValideCommandeFournisseurState createState() =>
      ValideCommandeFournisseurState();
}

class ValideCommandeFournisseurState extends State<ValideCommandeFournisseur> {
  bool _isLoading = true;

  List<Facture>? _commande = [];

  getAllCommande() async {
    setState(() {
      _isLoading = false;
    });
    _commande = [
      ...(await FournisseurService.getAllNonValide())!,
      ...(await FournisseurService.getAllValide())!
    ];
    setState(() {
      _isLoading = false;
    });
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
        backgroundColor: Color(0xFFFF5400),
        title: Text('Commandes Fournisseur'),
      ),
      body: _isLoading
          ? const FullScreenDimmer()
          : ListView.builder(
              itemCount: _commande!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(_commande![index].reference.toString()),
                    subtitle: Text('Quantity: ${index + 1}'),
                    trailing: IconButton(
                      icon: Icon(Icons.visibility, color: Colors.black),
                      onPressed: () {
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Details_command_fournisseur()));
                          // handle visibility button press for this item
                          print('Showing details for item ${index + 1}.');
                        }
                        // handle visibility button press for this item
                        print('Showing details for item ${index + 1}.');
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
