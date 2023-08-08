import 'package:flutter/material.dart';

import 'add.dart';
import 'addSomeThing.dart';
import 'contaiaddsupup.dart';

class gereMenu extends StatefulWidget {
  const gereMenu({Key? key}) : super(key: key);

  @override
  State<gereMenu> createState() => _gereMenuState();
}

class _gereMenuState extends State<gereMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Add(onTap: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AddSomeThing()),
        );},),
        Gerer(title: "Gerer Menu",)
      ],),

    );
  }
}
