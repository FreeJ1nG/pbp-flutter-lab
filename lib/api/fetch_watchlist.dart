import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/models/watchlist.dart';

Future<List<WatchlistItem>> fetchWatchlist(
    changeWatched, changeFetched, watched, fetched) async {
  var url =
      Uri.parse('https://andrew-pbp-tugas2.herokuapp.com/mywatchlist/json');
  var response = await http.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
  });
  var data = json.decode(utf8.decode(response.bodyBytes));

  List<WatchlistItem> watchlistItems = [];
  for (var d in data) {
    watchlistItems.add(WatchlistItem.fromJson(d));
  }
  if (!fetched) {
    changeWatched(watchlistItems.map((item) => item.watched).toList());
  }
  changeFetched();
  return watchlistItems;
}
