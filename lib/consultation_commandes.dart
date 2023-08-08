import 'package:flutter/material.dart';
import 'package:last/api/commande_service.dart';
import 'package:last/widgets/dimmer_loading.dart';
import 'package:last/widgets/ggggggggggggggggggggg.dart';


import 'models/Facture.dart';

class ConsultationCommandes extends StatefulWidget {
  @override
  State<ConsultationCommandes> createState() => _ConsultationCommandesState();
}

class _ConsultationCommandesState extends State<ConsultationCommandes> {





  bool _isLoading = true;

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
    getAllCommande();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des commandes'),
        backgroundColor: const Color(0xFFFF5400),
      ),
      body: _isLoading
          ? const FullScreenDimmer()
          : ListView.builder(
              itemCount: _commande!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsScreen(
                            orderName: _commande![index].reference!),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        _commande![index].reference!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

