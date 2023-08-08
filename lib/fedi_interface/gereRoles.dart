import 'package:flutter/material.dart';
import 'package:last/fedi_interface/contaiaddsupup.dart';

import 'add.dart';
import 'addSomeThing.dart';

class gereRoles extends StatefulWidget {
  const gereRoles({Key? key}) : super(key: key);

  @override
  State<gereRoles> createState() => _gereRolesState();
}

class _gereRolesState extends State<gereRoles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Add(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddSomeThing()),
              );
            },
          ),
          Gerer(
            title: "Gerer Roles",
          )
        ],
      ),
    );
  }
}
