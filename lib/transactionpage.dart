import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<Transaction> transactions = [
    Transaction(
      title: 'Chèques ',
      total: 5000.0,
      details: {
        'émis': 10,
        'reçus': 5,
      },
    ),
    Transaction(
      title: 'Traitements',
      total: 10000.0,
      details: {
        'en cours': 2,
      },
    ),
    Transaction(
      title: 'Virements',
      total: 7500.0,
      details: {
        'reçus': 5,
      },
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facture non payee'),
         backgroundColor: Color(0xFFFF5400),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          Transaction transaction = transactions[index];
          return ExpansionTile(
            leading: Icon(Icons.monetization_on),
            title: Text(transaction.title),
            
            subtitle: Text('\$${transaction.total.toStringAsFixed(2)}'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Détails')),
                    DataColumn(label: Text('Valeur')),
                  ],
                  rows: transaction.details.entries
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.key)),
                            DataCell(Text(e.value.toString())),
                          ]))
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Transaction {
  String title;
  double total;
  Map<String, int> details;

  Transaction({required this.title, required this.total, required this.details});
}
