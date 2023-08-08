import 'package:flutter/material.dart';
import 'package:last/reglement.dart';

class etat extends StatefulWidget {
  const etat({super.key});

  @override
  State<etat> createState() => _etatState();
}

class _etatState extends State<etat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Reglement(),
      body: Center(
        child: Text("jassem"),
      ),
    );
  }
}
