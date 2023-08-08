import 'package:flutter/material.dart';

import 'admin_dsh.dart';
import 'gereMenu.dart';
import 'gereRoles.dart';
import 'gereUt.dart';


class Menu1 extends StatefulWidget {
  const Menu1({Key? key}) : super(key: key);

  @override
  State<Menu1> createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return  Scaffold(
      body: Container(
        alignment: Alignment.center ,
        child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget> [

              Menu(title:"Gerer Utilisateur",onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GereUt()),
                );
              },),


            ],

        ),
      ),
    );
  }
}
