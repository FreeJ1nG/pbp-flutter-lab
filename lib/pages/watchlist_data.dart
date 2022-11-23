import 'package:flutter/material.dart';
import 'package:counter_7/components/drawer.dart';
import 'package:counter_7/models/transaction.dart';
import 'package:counter_7/api/fetch_watchlist.dart';
import 'package:counter_7/pages/watchlist_detail.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage(
      {super.key, required this.transactions, required this.saveTransaction});
  final Function(Transaction newTransaction) saveTransaction;
  final List<Transaction> transactions;

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  List<bool> watched = [];
  bool fetched = false;

  void changeFetched() {
    fetched = true;
  }

  void changeWatched(List<bool>? newWatched) {
    watched = newWatched!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Watchlist")),
        drawer: DrawerApp(
            saveTransaction: widget.saveTransaction,
            transactions: widget.transactions),
        body: FutureBuilder(
            future:
                fetchWatchlist(changeWatched, changeFetched, watched, fetched),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada film didalam watchlist :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: watched[index]
                                      ? Colors.blue
                                      : Colors.grey,
                                  width: 2)),
                          child: TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WatchlistDetailPage(
                                          watchlist: snapshot.data![index],
                                          saveTransaction:
                                              widget.saveTransaction,
                                          transactions: widget.transactions,
                                          watched: watched[index],
                                        ))),
                            child: Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: watched[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        watched[index] = value!;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                      child: Text(
                                    "${snapshot.data![index].title}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ))
                                ])),
                          )));
                }
              }
            }));
  }
}
