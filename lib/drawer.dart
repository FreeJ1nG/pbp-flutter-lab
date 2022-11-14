import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/models/transaction_data.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp(
      {super.key, required this.saveTransaction, required this.transactions});
  final Function(Transaction newTransaction) saveTransaction;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MyFormPage(
                          saveTransaction: saveTransaction,
                          transactions: transactions,
                        )),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MyDataPage(
                          saveTransaction: saveTransaction,
                          transactions: transactions,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
