import 'package:flutter/material.dart';
import 'package:last/models/Facture.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:printing/printing.dart';

class pdf2 extends StatefulWidget {
  Facture id;

  pdf2({required this.id});

  @override
  State<pdf2> createState() => _pdf2State();
}

class _pdf2State extends State<pdf2> {
  void initState() {
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Scaffold(
      body: PdfPreview(
        build: (format) => _createPdf(
          format,
        ),
      ),
    );
  }

  Future<Uint8List> _createPdf(
      PdfPageFormat format,
      ) async {
    final pdf = pdfWid.Document(
      version: PdfVersion.pdf_1_4,
      compress: true,
    );
    pdf.addPage(
      pdfWid.Page(
        pageFormat: PdfPageFormat((80 * (72.0 / 25.4)), 600,
            marginAll: 5 * (72.0 / 25.4)),
        //pageFormat: format,
        build: (context) {
          return pdfWid.SizedBox(
            width: double.infinity,
            child: pdfWid.FittedBox(
              child: pdfWid.Column(
                children: [
                  pdfWid.SizedBox(
                    height: 50,
                  ),
                  pdfWid.SizedBox(height: 50),
                  pdfWid.Padding(
                    padding:
                    pdfWid.EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: pdfWid.Row(
                      mainAxisAlignment: pdfWid.MainAxisAlignment.spaceEvenly,
                      children: [
                        pdfWid.Text("Facture                 ",
                            style: pdfWid.TextStyle(
                                fontWeight: pdfWid.FontWeight.bold,
                                fontSize: 20)),
                        pdfWid.Container(
                          decoration: pdfWid.BoxDecoration(
                              border: pdfWid.Border.all(
                                color: PdfColors.black,
                              ),
                              borderRadius: pdfWid.BorderRadius.circular(10)),
                          height: 50,
                          width: 140,
                          child: pdfWid.Row(
                            children: [
                              pdfWid.Container(
                                alignment: pdfWid.Alignment.center,
                                decoration: pdfWid.BoxDecoration(
                                  border: pdfWid.Border(
                                      right: pdfWid.BorderSide(
                                          color: PdfColors.black)),
                                ),
                                height: 50,
                                width: 45,
                                child: pdfWid.Text('Ref',
                                    style: pdfWid.TextStyle(
                                        fontWeight: pdfWid.FontWeight.bold)),
                              ),
                              pdfWid.Padding(
                                padding: pdfWid.EdgeInsets.only(left: 10),
                                child: pdfWid.Text(
                                    '${widget.id.reference}'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  pdfWid.Padding(
                    padding:
                    pdfWid.EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: pdfWid.Row(
                      mainAxisAlignment: pdfWid.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pdfWid.CrossAxisAlignment.start,
                      children: [
                        pdfWid.Container(
                          child: pdfWid.Column(
                            children: [
                              pdfWid.Container(height: 40, width: 40),
                              pdfWid.Padding(
                                padding: pdfWid.EdgeInsets.only(top: 60),
                                child: pdfWid.RichText(
                                  text: pdfWid.TextSpan(
                                    children: [
                                      pdfWid.TextSpan(
                                          text: 'Etat',
                                          style: pdfWid.TextStyle(
                                              color: PdfColors.orange,
                                              fontWeight:
                                              pdfWid.FontWeight.bold,
                                              fontSize: 30)),
                                      pdfWid.TextSpan(
                                          text: " : ${widget.id.etat}",
                                          style: pdfWid.TextStyle(
                                            color: PdfColors.black,
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        pdfWid.Container(
                          child: pdfWid.Column(children: [
                            pdfWid.Container(
                              alignment: pdfWid.Alignment.center,
                              decoration: pdfWid.BoxDecoration(
                                  borderRadius:
                                  pdfWid.BorderRadius.circular(5)),
                              height: 200,
                              width: 180,
                              child: pdfWid.Container(
                                child: pdfWid.Column(children: [
                                  pdfWid.Container(
                                    alignment: pdfWid.Alignment.center,
                                    decoration: pdfWid.BoxDecoration(
                                        color: PdfColors.deepOrange,
                                        borderRadius:
                                        pdfWid.BorderRadius.circular(5)),
                                    height: 40,
                                    width: 180,
                                    child: pdfWid.Text("Information"),
                                  ),
                                  pdfWid.Padding(
                                    padding: pdfWid.EdgeInsets.only(top: 60),
                                    child: pdfWid.Text(
                                      'Id : ${widget.id.id}',
                                      style: pdfWid.TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  pdfWid.Row(
                    children: [
                      pdfWid.Padding(
                        padding: pdfWid.EdgeInsets.only(top: 20, left: 6),
                        child: pdfWid.Container(
                            width: 365,
                            height: 40,
                            decoration: pdfWid.BoxDecoration(
                              border: pdfWid.Border.all(color: PdfColors.black),
                            ),
                            child: pdfWid.Column(
                              children: [
                                pdfWid.Container(
                                  width: 365,
                                  height: 17,
                                  decoration: pdfWid.BoxDecoration(
                                    color: PdfColors.deepOrange,
                                    border: pdfWid.Border(
                                        bottom: pdfWid.BorderSide(
                                            color: PdfColors.black)),
                                  ),
                                  child: pdfWid.Row(
                                    children: [
                                      pdfWid.Container(
                                        alignment: pdfWid.Alignment.center,
                                        width: 90,
                                        height: 16,
                                        decoration: pdfWid.BoxDecoration(
                                          color: PdfColors.deepOrange,
                                          border: pdfWid.Border(
                                              right: pdfWid.BorderSide(
                                                  color: PdfColors.black)),
                                        ),
                                        child: pdfWid.Text("Command ID"),
                                      ),
                                      pdfWid.Container(
                                        alignment: pdfWid.Alignment.center,
                                        width: 90,
                                        height: 16,
                                        decoration: pdfWid.BoxDecoration(
                                          color: PdfColors.deepOrange,
                                          border: pdfWid.Border(
                                              right: pdfWid.BorderSide(
                                                  color: PdfColors.black)),
                                        ),
                                        child: pdfWid.Text("Total_horstaxe"),
                                      ),
                                      pdfWid.Container(
                                        alignment: pdfWid.Alignment.center,
                                        width: 90,
                                        height: 16,
                                        decoration: pdfWid.BoxDecoration(
                                          color: PdfColors.deepOrange,
                                          border: pdfWid.Border(
                                              right: pdfWid.BorderSide(
                                                  color: PdfColors.black)),
                                        ),
                                        child: pdfWid.Text("Total_fodac"),
                                      ),
                                      pdfWid.Container(
                                        alignment: pdfWid.Alignment.center,
                                        width: 90,
                                        height: 16,
                                        decoration: pdfWid.BoxDecoration(
                                          color: PdfColors.deepOrange,
                                        ),
                                        child: pdfWid.Text("Total_tva"),
                                      ),
                                    ],
                                  ),
                                ),
                                pdfWid.Row(
                                  children: [
                                    pdfWid.Container(
                                      alignment: pdfWid.Alignment.center,
                                      width: 90,
                                      height: 22,
                                      decoration: pdfWid.BoxDecoration(
                                        border: pdfWid.Border(
                                            right: pdfWid.BorderSide(
                                                color: PdfColors.black)),
                                      ),
                                      child: pdfWid.Text(
                                          "${widget.id.commande!.id}"),
                                    ),
                                    pdfWid.Container(
                                      alignment: pdfWid.Alignment.center,
                                      width: 90,
                                      height: 22,
                                      decoration: pdfWid.BoxDecoration(
                                        border: pdfWid.Border(
                                            right: pdfWid.BorderSide(
                                                color: PdfColors.black)),
                                      ),
                                      child: pdfWid.Text(
                                          "${widget.id.commande!.totalHorsTaxe} DT"),
                                    ),
                                    pdfWid.Container(
                                      alignment: pdfWid.Alignment.center,
                                      width: 90,
                                      height: 22,
                                      decoration: pdfWid.BoxDecoration(
                                        border: pdfWid.Border(
                                            right: pdfWid.BorderSide(
                                                color: PdfColors.black)),
                                      ),
                                      child: pdfWid.Text(
                                          "${widget.id.commande!.totalTva} DT"),
                                    ),
                                    pdfWid.Container(
                                      alignment: pdfWid.Alignment.center,
                                      width: 80,
                                      height: 22,
                                      decoration: pdfWid.BoxDecoration(),
                                      child: pdfWid.Text(
                                          "${widget.id.commande!.totalFodac} DT"),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  pdfWid.Padding(
                    padding: pdfWid.EdgeInsets.only(right: 0.8),
                    child: pdfWid.Container(
                      alignment: pdfWid.Alignment.topRight,
                      child: pdfWid.Container(
                        alignment: pdfWid.Alignment.center,
                        width: 180,
                        height: 15,
                        decoration: pdfWid.BoxDecoration(
                          border: pdfWid.Border(
                            right: pdfWid.BorderSide(color: PdfColors.black),
                            left: pdfWid.BorderSide(color: PdfColors.black),
                            bottom: pdfWid.BorderSide(color: PdfColors.black),
                          ),
                        ),
                        child: pdfWid.Row(
                          children: [
                            pdfWid.Container(
                              alignment: pdfWid.Alignment.center,
                              width: 90,
                              decoration: pdfWid.BoxDecoration(
                                color: PdfColors.grey,
                                border: pdfWid.Border(
                                    right: pdfWid.BorderSide(
                                        color: PdfColors.black)),
                              ),
                              child: pdfWid.Text('total_ttc'),
                            ),
                            pdfWid.Container(
                              alignment: pdfWid.Alignment.center,
                              width: 90,
                              decoration: pdfWid.BoxDecoration(),
                              child: pdfWid.Text(
                                '${widget.id.commande!.totalTtc} DT',
                                style: pdfWid.TextStyle(
                                    fontWeight: pdfWid.FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  pdfWid.SizedBox(
                    height: 18,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
    return pdf.save();
  }
}
