import 'package:flutter/material.dart';
import 'package:last/api/coffre_service.dart';

class Etat_De_Cauffre extends StatefulWidget {
  const Etat_De_Cauffre({super.key});

  @override
  State<Etat_De_Cauffre> createState() => _Etat_De_CauffreState();
}

class _Etat_De_CauffreState extends State<Etat_De_Cauffre> {
  bool _isLoading = true;
  String _totalEspece = "",
      _totalVirement = "",
      _totalCheque = "",
      _totalCaisse = "";

  getInfos() async {
    _totalVirement = (await CofferService.getVirement())!;
    _totalCheque = (await CofferService.getCheque())!;
    _totalEspece = (await CofferService.getEspece())!;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            component(_totalCheque, "cheques"),
            const SizedBox(
              height: 10,
            ),
            component(_totalVirement, "virement"),
            const SizedBox(
              height: 10,
            ),
            component(_totalEspece, "Espece"),
            const SizedBox(
              height: 60,
            ),
            const Image(
              width: 185,
              height: 185,
              image: AssetImage("assets/images/coffre.png"),
            ),
          ],
        ),
      ),
    );
  }

  Widget component(String txt, String type) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Row(children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Total des $type : ${int.parse(txt.replaceAll('"', ""))}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 12,
                ),
                _isLoading
                    ? const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator())
                    : const SizedBox()
              ])),
        ),
      );
}
