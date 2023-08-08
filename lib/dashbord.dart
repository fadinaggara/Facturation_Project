
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:last/diagram.dart';
import 'package:last/models/Client.dart';


import 'api/client_service.dart';
import 'container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  List<ClientModel>? _clients = [];
  getBonLivraison() async {
    setState(() {
      _isLoading = true;
    });
    _clients = await ClientService.getAllClient();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getBonLivraison();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              child: FutureBuilder<List<ClientModel>?>(
                  future: ClientService.getAllClient(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ClientModel>?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
                        child: CircularProgressIndicator(),

                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.hasData) {
                      return Column(

                        children: [
                          Diagram(clients: snapshot.data),

                          DashContainer(clients: snapshot.data),

                        ],


                      );

                    } else {
                      print("**************** ${snapshot.data.toString()}");
                      return Text(snapshot.error.toString());

                    }
                  }
                  ),

            )
        ),
      ),
    );
  }
}
