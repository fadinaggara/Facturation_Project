import 'package:flutter/material.dart';
import 'package:last/fedi_interface/captureeeeeee.dart';
import 'package:last/models/Livraison.dart';

import 'widgets/responsive.dart';

class liv extends StatefulWidget {
  Livraison livraison;

  liv({required this.livraison});

  @override
  State<liv> createState() => _livState();
}

class _livState extends State<liv> {
  List<Livraison>? _listOfBonLivraison = [];
  void initState() {
    print(widget.livraison);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    Text("Bon de Livraison",
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
                                Text('${widget.livraison.commande!.reference}'),
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
                                      text: 'S',
                                      style: TextStyle(
                                          fontFamily: 'Cardo',
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30)),
                                  TextSpan(
                                      text: "imsoft",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
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
                                child: Text(
                                  '${widget.livraison.commande!.distination}',
                                  style: TextStyle(fontSize: 15),
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
                                    child: Text("Quantité"),
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
                                      "${widget.livraison.commande!.quantit}"),
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
                                      "${widget.livraison.commande!.article![0].prixUnitaire} DT"),
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
                                      "${widget.livraison.commande!.totalTtc} DT"),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: getResponsiveItemSize(
                                      width: size.width, value: 90),
                                  height: size.height * 0.13,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                      "${widget.livraison.commande!.totalFodac} DT"),
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
                            '${widget.livraison.commande!.totalTtc} DT',
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
  }
}
