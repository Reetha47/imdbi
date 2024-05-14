import 'dart:convert';

import 'package:film_rater/film_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String baseUrl = "http://www.omdbapi.com/";
String apiKey = "73263894";

class FilmProvider extends ChangeNotifier {
  List<Film> film = [];

  List<Film> get currentFilm => film;

  void getFilm(String title) async {
    film = [];
    notifyListeners();
    final response =
        await http.get(Uri.parse("$baseUrl?t=$title&apikey=$apiKey"));

    var movieMap = jsonDecode(response.body);
    print("------------ response -------------- $movieMap");
    film.add(Film.fromMap(movieMap));
    notifyListeners();
  }
}
