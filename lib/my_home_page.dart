import 'package:flutter/material.dart';
import 'package:last/bons_de_livraison.dart';
import 'package:last/constants/config.dart';
import 'package:last/dashbord.dart';
import 'package:last/fedi_interface/gereUt.dart';
import 'package:last/reglement.dart';

import 'Client.dart';
import 'Fournisseur.dart';
import 'api/auth_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.role}) : super(key: key);

  final List<dynamic> role;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<String> a = [];
  // List<String> _permissions = [];

  // getAllPermission() {
  //   if (widget.role.isNotEmpty) {
  //     var data = widget.role[0]['permissions'];
  //     data.forEach((e) {
  //       _permissions.add(e['name']);
  //     });
  //   }
  // }

  @override
  void initState() {
    //getAllPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to SIMSOFT APP'),
        backgroundColor: const Color(0xFFFF5400),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton.icon(
              onPressed: () async {
                // Do something when the button is pressed
                await AuthService.signOut();
                // ignore: use_build_context_synchronously
                // Navigator.push(
                //   context,
                //    MaterialPageRoute(builder: (context) => SigninScreen()),
                //);
              },
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFFFF5400),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Vous êtes connecté en tant que ${widget.role.isEmpty ? "utilisateur" : widget.role.isNotEmpty && widget.role[0]["name"] == "admin" ? "administrateur" : widget.role[0]["name"] == "" ? "utilisateur" : widget.role[0]["name"]}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.count(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuItem(
                    'Tableau de bord',
                    'assets/images/tableau de bord.png',
                    HomePage(),
                  ),
                  _buildMenuItem(
                    'Bon de livraison',
                    'assets/images/bon de livraison.png',
                    BonDeLivraisons(),
                  ),
                  _buildMenuItem(
                    'Client',
                    'assets/images/client.png',
                    Client(),
                  ),
                  _buildMenuItem(
                    'Fournisseur',
                    'assets/images/fournisseur.png',
                    const Fournisseur(),
                  ),
                  _buildMenuItem(
                    'Règlement',
                    'assets/images/reglement.png',
                    const Reglement(),
                  ),
                  _buildMenuItem(
                    'Gérer Utilisateur',
                    'assets/images/utilisateur.png',
                    const GereUt(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, String imageAsset, Widget route) {
    bool isEnabled = widget.role.isEmpty
        ? true
        : widget.role[0]['name'].toLowerCase() == "directeur usine" ||
        widget.role[0]['name'].toLowerCase() == "directeur dav"
        ? directeurdav.contains(title)
        : widget.role[0]['name'].toLowerCase() == "directeur finance"
        ? directeurFinance.contains(title)
        : widget.role[0]['name'].toLowerCase() == 'admin'
        ? true
        : false;
    if (isEnabled) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset,
                width: 128,
                height: 128,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
