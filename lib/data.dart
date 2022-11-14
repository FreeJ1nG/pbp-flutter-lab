import 'package:counter_7/drawer.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/models/transaction_data.dart';

class MyDataPage extends StatefulWidget {
  const MyDataPage(
      {super.key, required this.transactions, required this.saveTransaction});
  final Function(Transaction newTransaction) saveTransaction;
  final List<Transaction> transactions;

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transactions'),
        ),
        drawer: DrawerApp(
            saveTransaction: widget.saveTransaction,
            transactions: widget.transactions),
        body: Column(children: [
          const SizedBox(height: 16),
          ...widget.transactions
              .map((transaction) => Center(
                      child: Column(children: [
                    Container(
                        width: 320,
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey[100],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 2,
                                offset: const Offset(1, 2),
                              ),
                            ]),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                transaction.title ?? "",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(transaction.nominal.toString(),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                              Text(transaction.transactionType ?? "",
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500))
                            ],
                          )
                        ])),
                    const SizedBox(height: 12),
                  ])))
              .toList(),
          const SizedBox(height: 12)
        ]));
  }
}