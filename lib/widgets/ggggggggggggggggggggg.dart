import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String orderName;


  OrderDetailsScreen({required this.orderName});

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool isAssigned = false;

  void toggleAssignment() {
    setState(() {
      isAssigned = !isAssigned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.orderName),
        backgroundColor: const Color(0xFFFF5400),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Détails de la commande ${widget.orderName}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Icon(Icons.assignment_ind),
                const SizedBox(width: 10),
                const Text(
                  'Affecté à: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  isAssigned ? 'Validé' : 'Non validé',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: Text(isAssigned ? 'Non Validé' : 'Validé'),
              onPressed: toggleAssignment,
            ),
          ],
        ),
      ),
    );
  }
}
