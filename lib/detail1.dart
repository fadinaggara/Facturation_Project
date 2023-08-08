import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:last/widgets/responsive.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

import 'models/Facture.dart';

class Detail1 extends StatefulWidget {
  Facture id;

  Detail1({required this.id});

  @override
  State<Detail1> createState() => _Detail1State();
}

class _Detail1State extends State<Detail1> {
  @override
  Widget build(BuildContext context) {

    List<Facture>? _facture = [];
    void initState() {
      print(widget.id);
      super.initState();
    }

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: size.height*0.05,),
              Image(image: AssetImage("assets/images/simo.png"),width: size.width*0.4),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Facture",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      width:
                      getResponsiveItemSize(width: size.width, value: 120),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Colors.black)),
                            ),
                            height: 50,
                            width: getResponsiveItemSize(
                                width: size.width, value: 35),
                            child: Text('Ref',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child:
                            Text('${widget.id.reference}'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.04,
                            width: getResponsiveItemSize(
                                width: size.width, value: 120),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 60),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Etat',
                                      style: TextStyle(
                                          fontFamily: 'Cardo',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  TextSpan(
                                      text: ": ${widget.id.etat}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Cardo',
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          height: 200,
                          width: getResponsiveItemSize(
                              width: size.width, value: 180),
                          child: Container(
                            child: Column(children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(5)),
                                height: 40,
                                width: getResponsiveItemSize(
                                    width: size.width, value: 180),
                                child: Text("Information"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Column(children: [
                                  SizedBox(height: 5),
                                  Text('Id : ${widget.id.id}'),

                                ],)
                              ),
                            ]),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 6),
                    child: Container(
                        width: getResponsiveItemSize(
                            width: size.width, value: 365),
                        height: size.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: getResponsiveItemSize(
                                  width: size.width, value: 365),
                              height: size.height * 0.05,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: getResponsiveItemSize(
                                        width: size.width, value: 90),
                                    height: size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      border: Border(
                                          right:
                                          BorderSide(color: Colors.black)),
                                    ),
                                    child: Text("Command ID"),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: getResponsiveItemSize(
                                        width: size.width, value: 90),
                                    height: size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      border: Border(
                                          right:
                                          BorderSide(color: Colors.black)),
                                    ),
                                    child: Text("Total_horstaxe"),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: getResponsiveItemSize(
                                        width: size.width, value: 90),
                                    height: size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      border: Border(
                                          right:
                                          BorderSide(color: Colors.black)),
                                    ),
                                    child: Text("Total_fodac"),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: getResponsiveItemSize(
                                        width: size.width, value: 90),
                                    height: size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                    ),
                                    child: Text("Total_tva"),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: getResponsiveItemSize(
                                      width: size.width, value: 90),
                                  height: size.height * 0.13,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(color: Colors.black)),
                                  ),
                                  child: Text(
                                      "${widget.id.commande!.id}"),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: getResponsiveItemSize(
                                      width: size.width, value: 90),
                                  height: size.height * 0.13,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(color: Colors.black)),
                                  ),
                                  child: Text(
                                      "${widget.id.commande!.totalHorsTaxe} DT"),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: getResponsiveItemSize(
                                      width: size.width, value: 90),
                                  height: size.height * 0.13,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(color: Colors.black)),
                                  ),
                                  child: Text(
                                      "${widget.id.commande!.totalTva} DT"),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: getResponsiveItemSize(
                                      width: size.width, value: 90),
                                  height: size.height * 0.13,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                      "${widget.id.commande!.totalFodac} DT"),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    width: getResponsiveItemSize(width: size.width, value: 185),
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: getResponsiveItemSize(
                              width: size.width, value: 90),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            border:
                            Border(right: BorderSide(color: Colors.black)),
                          ),
                          child: Text('total_ttc'),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: getResponsiveItemSize(
                              width: size.width, value: 90),
                          decoration: BoxDecoration(),
                          child: Text(
                            '${widget.id.commande!.totalTtc} DT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.08,)
            ],
          ),
        ),


      ),
    );
    /*SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              Center(
                child: Text(
                  'Details Facture',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text('Id : 4'),
              SizedBox(height: 30),
              Text('Référence de la facture: FCT-0004'),
              SizedBox(height: 30),
              Text('Etat: non payee'),
              SizedBox(height: 30),
              Text('Commande ID: 5'),
              SizedBox(height: 30),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total hors taxe: 100 dt',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total FODAC: 10 dt',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total TVA: 21 dt',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total timbre: 1 dt',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Total TTC: 132 dt',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    generateAndSavePDF();
                  },
                  tooltip: 'Download File',
                  child: const Icon(Icons.download),
                ),
              )
            ],
          ),
        ),
      ),
    );*/
  }
  /* Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FactureListClient(),
                      ),
                    );
                  },
                  child: Text('Retour'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFFF5400)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),*/

  Future<void> generateAndSavePDF() async {
    final font = await rootBundle.load('assets/fonts/Roboto-Regular.ttf');
    final ttf = pw.Font.ttf(font);
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Hello, World!', style: pw.TextStyle(fontSize: 40)),
          );
        },
      ),
    );

    // Save the PDF file
    final output =
        await getExternalStorageDirectory(); // Get the device's external storage directory
    final file = File('${output?.path}/facture_details.pdf');
    await file.writeAsBytes(await pdf.save());

    print('PDF saved at: ${file.path}');
  }
}
