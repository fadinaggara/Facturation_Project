/*import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/widgets.dart' as pw;

class facture extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facture #1234'),
        backgroundColor: Color(0xFFFF5400),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // Générer et télécharger le PDF
              _generateAndDownloadPdf();
            },
          ),
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Destinataire:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('John Doe'),
            Text('1234 Rue du Commerce'),
            Text('75001 Paris'),
            SizedBox(height: 20),
            Text(
              'Détails de la facture:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Article 1'),
                Text('\$10.00'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Article 2'),
                Text('\$5.00'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:'),
                Text('\$15.00'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _generateAndDownloadPdf() async {
    final pdf = pw.Document();

    // Ajouter les éléments de la facture au PDF
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text('Ma facture'),
        );
      },
    ));

    // Enregistrer le PDF dans un fichier temporaire
    final output = await getTemporaryDirectory();
   // final file = File('${output.path}/my_invoice.pdf');
   // await file.writeAsBytes(pdf.save());

    // Ouvrir le fichier PDF dans une application externe pour le télécharger
   // await OpenFile.open(file.path);
  }
}*/
import 'package:flutter/material.dart';
import 'package:last/api/facture_service.dart';
import 'package:last/detail1.dart';

import 'models/Facture.dart';

class FactureListClient extends StatefulWidget {
  @override
  State<FactureListClient> createState() => _FactureListClientState();
}

class _FactureListClientState extends State<FactureListClient> {
  bool _isLoading = false;

  List<Facture>? _factures = [];
  getAllFacture() async {
    setState(() {
      _isLoading = false;
    });
    _factures = await FactureService.consulterListeBonLivraision();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getAllFacture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factures Client'),
        backgroundColor: const Color(0xFFFF5400),
      ),
      body: ListView.builder(
        itemCount: _factures!.length,
        itemBuilder: (BuildContext context, int index) {
          final facture = _factures![index];
          return ListTile(
              title: Text('Facture ${facture.reference}'),
              subtitle: Text(
                  'Customer: ${facture.commande!.client ?? "Pas assigner"}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail1(
                          id: _factures![
                          index]
                      ),
                    ),
                  );
                  // Add code to show details for this facture
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(
                      0xFFFF5400), // sets background color of button
                  onPrimary: Colors.white, // sets text color of button
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
