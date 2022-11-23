import 'package:flutter/material.dart';
import 'package:counter_7/models/watchlist.dart';
import 'package:counter_7/components/drawer.dart';
import 'package:counter_7/models/transaction.dart';

class WatchlistDetailPage extends StatefulWidget {
  const WatchlistDetailPage(
      {super.key,
      required this.watchlist,
      required this.saveTransaction,
      required this.transactions,
      required this.watched});
  final Function(Transaction newTransaction) saveTransaction;
  final List<Transaction> transactions;
  final WatchlistItem watchlist;
  final bool watched;

  @override
  State<WatchlistDetailPage> createState() => _WatchlistDetailPageState();
}

class _WatchlistDetailPageState extends State<WatchlistDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detail")),
        drawer: DrawerApp(
            saveTransaction: widget.saveTransaction,
            transactions: widget.transactions),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        onPressed: (() => Navigator.pop(context)),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ))))),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(widget.watchlist.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                const SizedBox(height: 32),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: 'Release Date: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          widget.watchlist.releaseDate.toString().split(" ")[0])
                ])),
                const SizedBox(height: 8),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: 'Rating: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: widget.watchlist.rating)
                ])),
                const SizedBox(height: 8),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: 'Status: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: widget.watched ? "watched" : "not watched")
                ])),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Review:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Text(widget.watchlist.review),
                  ],
                ),
              ],
            )));
  }
}
