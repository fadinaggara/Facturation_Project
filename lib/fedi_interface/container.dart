import 'package:flutter/material.dart';

class DashContainer extends StatelessWidget {
  const DashContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;

    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.03,
          bottom: size.height * 0.03,
          right: size.width * 0.04,
          left: size.width * 0.04),
      child: Container(
        height: size.height * 0.4,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10),),
              color: Colors.blue.shade800,),
            height: size.height * 0.04,
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.04,
                  top: size.width * 0.01,
                  right: size.width * 0.04),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Fournisseur', style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),),
                  Text('Montant HT', style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),),
                ],),
            ),
          ),
        ]),
      ),
    );
  }
}
