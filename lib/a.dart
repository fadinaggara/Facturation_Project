/*import 'package:flutter/material.dart';

class BonDeLivraisonScreen extends StatefulWidget {
  @override
  _BonDeLivraisonScreenState createState() => _BonDeLivraisonScreenState();
}

class _BonDeLivraisonScreenState extends State<BonDeLivraisonScreen> {
  List<Map<String, dynamic>> _factures = [
    {'client': 'Client 1', 'total': 100.0, 'detail': 'Détail facture 1'},
    {'client': 'Client 2', 'total': 200.0, 'detail': 'Détail facture 2'},
    {'client': 'Client 3', 'total': 300.0, 'detail': 'Détail facture 3'},
  ];

  int _selectedFactureIndex = -1;

  void _toggleFactureDetail(int index) {
    setState(() {
      if (_selectedFactureIndex == index) {
        _selectedFactureIndex = -1;
      } else {
        _selectedFactureIndex = index;
      }
    });
  }

  Widget _buildFactureDetail(int index) {
    if (_selectedFactureIndex == index) {
      return Container(
        padding: EdgeInsets.all(16.0),
        height: 100.0,
        color: Colors.grey[200],
        child: Center(
          child: Text(_factures[index]['detail']),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bons de livraison'),
      ),
      body: Column(
        children: _factures
            .asMap()
            .entries
            .map(
              (entry) => Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(entry.value['client']),
                        Text('Total : ${entry.value['total']} €'),
                        ElevatedButton(
                          onPressed: () => _toggleFactureDetail(entry.key),
                          child: Text('+'),
                        ),
                      ],
                    ),
                  ),
                  _buildFactureDetail(entry.key),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FactureList(),
    );
  }
}

class Facture {
  final String title;
  final String description;

  Facture({required this.title, required this.description});
}

class FactureList extends StatefulWidget {
  const FactureList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FactureListState createState() => _FactureListState();
}

class _FactureListState extends State<FactureList> {
  List<Facture> factures = [
    Facture(title: 'Facture 1', description: 'Details for Facture 1'),
   
Facture(title: 'Facture 2', description: 'Details for Facture 2'),
    Facture(title: 'Facture 3', description: 'Details for Facture 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facture List'),
      ),
      body: ListView.builder(
        itemCount: factures.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(factures[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FactureDetails(facture: factures[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FactureDetails extends StatelessWidget {
  final Facture facture;

  const FactureDetails({Key? key, required this.facture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facture.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(facture.description),
      ),
    );
  }
}
