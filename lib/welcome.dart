
/*import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<welcome> {
  bool _isSidebarOpen = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        backgroundColor: Color(0xFFFF5400),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleSidebar,
        ),
      ),
      body: Row(
        children: [
          if (_isSidebarOpen)
            Container(
              width: 300,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      child: Text(
                        'MENU',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF5400),
                      ),
                    ),
                    ListTile(
                      title: const Text('Consultation des commandes'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Gestion des bons de livraisons'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Gestion des factures fournisseurs'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Gestion des factures clients'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Gestion des règlement'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Gestion des journaux'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text(
                        "Consultation de tableau de bord de chiffre d'affaire",
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Contenu principal',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/