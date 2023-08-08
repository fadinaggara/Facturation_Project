import 'package:flutter/material.dart';

class FactureList extends StatelessWidget {
  final List<facture> factures = [
    facture(id: 1, customerName: 'John Doe', totalAmount: 100),
    facture(id: 2, customerName: 'Jane Smith', totalAmount: 200),
    facture(id: 3, customerName: 'Bob Johnson', totalAmount: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('factures'),
      ),
      body: ListView.builder(
        itemCount: factures.length,
        itemBuilder: (BuildContext context, int index) {
          final facture = factures[index];
          return ListTile(
            title: Text('facture ${facture.id}'),
            subtitle: Text('Customer: ${facture.customerName}'),
            trailing: ElevatedButton(
  onPressed: () {
    // Add code to show details for this facture
  },
  child: Text('Details'),
  style: ElevatedButton.styleFrom(
    primary: Color(0xFFFF5400), // sets background color of button
    onPrimary: Colors.white, // sets text color of button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // sets rounded corners
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // sets padding
  ),
)
          );
        },
      ),
    );
  }
}

class facture {
  final int id;
  final String customerName;
  final double totalAmount;

  facture({
    required this.id,
    required this.customerName,
    required this.totalAmount,
  });
}
