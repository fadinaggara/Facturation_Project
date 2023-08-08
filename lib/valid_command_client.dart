import 'package:flutter/material.dart';
import 'package:last/Details_command_client.dart';
import 'package:last/api/livraison_service.dart';
import 'package:last/models/Livraison.dart';
import 'package:last/widgets/dimmer_loading.dart';

import 'api/commande_service.dart';
import 'models/Facture.dart';

class ValidCommandeClients extends StatefulWidget {
  @override
  ValidCommandeClientsState createState() => ValidCommandeClientsState();
}

class ValidCommandeClientsState extends State<ValidCommandeClients> {
  List<String> deliveryItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 13',
  ];
  bool _isLoading = true;
  List<Livraison>? _listOfBonLivraison = [];
  getBonLivraison() async {
    setState(() {
      _isLoading = true;
    });
    _listOfBonLivraison = await LivraisonService.consulterListeBonLivraision();
    setState(() {
      _isLoading = false;
    });
  }

  List<Facture>? _commande = [];

  getAllCommande() async {
    setState(() {
      _isLoading = false;
    });
    _commande = [
      ...(await CommandeService.getAllNonValide())!,
      ...(await CommandeService.getAllValide())!
    ];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    //getAllCommande();
    getBonLivraison();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5400),
        title: const Text('Commandes Client'),
      ),
      body: _isLoading
          ? const FullScreenDimmer()
          : ListView.builder(
              itemCount: _listOfBonLivraison!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(_listOfBonLivraison![index].commande!.reference!),
                    subtitle: Text(_listOfBonLivraison![index].commande!.etat!),
                    trailing: IconButton(
                      icon: const Icon(Icons.visibility, color: Colors.black),
                      onPressed: () {
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      command_client(idd: _listOfBonLivraison![
                                      index])));
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
