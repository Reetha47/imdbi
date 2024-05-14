import 'dart:convert';

import 'package:film_rater/list_of_film_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://www.omdbapi.com/";
String apiKey = "73263894";

class List_provider extends ChangeNotifier {
  List<List_film> lists = [];
  List<List_film> get groupfilm => lists;

  void getlists(String title) async {
    lists = [];

    final response =
        await http.get(Uri.parse("$baseUrl?s=$title&apikey=$apiKey"));
    List<List_film> update = [];
    var filmMap = jsonDecode(response.body);
    for (var listmap in filmMap["Search"]) {
      var movie = List_film.fromMap(listmap);
      update.add(movie);
    }
    lists = update;
    notifyListeners();
  }
}
