import 'package:flutter/material.dart';
import 'package:last/Details_bon_de_livraison.dart';
import 'package:last/bon_de%20l_liv.dart';
import 'package:last/fedi_interface/captureeeeeee.dart';
import 'package:last/models/Livraison.dart';
import 'package:last/widgets/dimmer_loading.dart';
import 'package:intl/intl.dart';


import 'api/livraison_service.dart';

class BonDeLivraisons extends StatefulWidget {
  @override
  BonDeLivraisonsState createState() => BonDeLivraisonsState();
}

class BonDeLivraisonsState extends State<BonDeLivraisons> {
  bool _isLoading = false;
  TextEditingController dateRangeController = TextEditingController();
  List<Livraison>? _listOfBonLivraison = [];

  getBonLivraison() async {
    setState(() {
      _isLoading = true;
    });
    _listOfBonLivraison = await LivraisonService.consulterListeBonLivraision();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    dateRangeController.text = "";
    getBonLivraison();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5400),
        title: const Text('Bon de Livraison'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              DateTimeRange? pickedDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                initialDateRange: DateTimeRange(
                  start: DateTime.now(),
                  end: DateTime.now().add(const Duration(days: 7)),
                ),
              );
              if (pickedDateRange != null) {
                String formattedDateRange = DateFormat("yyyy-MM-dd")
                        .format(pickedDateRange.start)
                        .toString() +
                    " to " +
                    DateFormat("yyyy-MM-dd")
                        .format(pickedDateRange.end)
                        .toString();

                setState(() {
                  dateRangeController.text = formattedDateRange;
                });
              } else {
                print("Not selected");
              }
            },
          )
        ],
      ),
      body: _isLoading
          ? const FullScreenDimmer()
          : Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: dateRangeController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    // Date range picker logic here
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _listOfBonLivraison!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(_listOfBonLivraison![index].reference!),
                          subtitle: Text('Quantity: ${_listOfBonLivraison?[index]?.commande?.quantit ?? 'N/A'}'),

                          trailing:
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              liv(
                                                  livraison: _listOfBonLivraison![
                                                  index]
                                              )
                                      )
                                  );
                                },
                                icon: Icon(Icons.visibility),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PDFView(
                                                  livraison: _listOfBonLivraison![
                                                  index]
                                              )
                                      )
                                  );
                                },
                                icon: Icon(Icons.download),
                              ),
                            ],
                          ),/*IconButton(
                            icon: const Icon(Icons.visibility,
                                color: Colors.black),
                            onPressed: () {
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            liv(
                                                livraison: _listOfBonLivraison![
                                                    index]
                                            )
                                    )
                                );
                                // handle visibility button press for this item
                                print('Showing details for item ${index + 1}.');
                              }
                              // handle visibility button press for this item
                              print('Showing details for item ${index + 1}.');
                            },
                          ),*/
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
