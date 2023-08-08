import 'package:flutter/material.dart';

import 'package:last/Etat_Caisse.dart';
import 'package:last/Etat_De_Cauffre.dart';
import 'package:last/widgets/factures_clients_reglement.dart';

import 'Etat_De_Decaissement.dart';

class Reglement extends StatefulWidget {
  const Reglement({Key? key}) : super(key: key);

  @override
  State<Reglement> createState() => _ReglementState();
}

class _ReglementState extends State<Reglement> {
  var currentPage = DrawerSections.etatdecauffre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5400),
        title: const Text("Gestion de Règlement"),
      ),
      body: SelectedContent(currentPage: currentPage),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Etat de Caisse", Icons.point_of_sale_outlined,
              currentPage == DrawerSections.etatdecaisse ? true : false),
          menuItem(2, "Etat De Cauffre", Icons.lock_outline,
              currentPage == DrawerSections.etatdecauffre ? true : false),
          menuItem(3, "Facture Non Payé", Icons.receipt_outlined,
              currentPage == DrawerSections.facturenonpaye ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.etatdecaisse;
            } else if (id == 2) {
              currentPage = DrawerSections.etatdecauffre;
            } else if (id == 3) {
              currentPage = DrawerSections.facturenonpaye;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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

enum DrawerSections {
  etatdecaisse,
  etatdecauffre,

  facturenonpaye,
}

class MyHeaderDrawer extends StatefulWidget {
  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFF5400),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          const Text(
            "Gestion de reglement",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "info@gestion de reglement.dev",
            style: TextStyle(
              color: Colors.red[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedContent extends StatelessWidget {
  final DrawerSections currentPage;

  SelectedContent({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case DrawerSections.etatdecaisse:
        return const Etat_De_Caisse();
      case DrawerSections.etatdecauffre:
        return const Etat_De_Cauffre();

      case DrawerSections.facturenonpaye:
        return FactReg();
      default:
        return FactReg();
    }
  }
}
