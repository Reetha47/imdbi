import 'package:film_rater/film_provider.dart';
import 'package:film_rater/film2.dart';
import 'package:film_rater/list_provider.dart';
import 'package:film_rater/listofmovies.dart';
import 'package:film_rater/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => FilmProvider(),
    ),
    ChangeNotifierProvider(create:(context) => List_provider(),)
  ], child: const FilmRater()));
}

class FilmRater extends StatefulWidget {
  const FilmRater({super.key});

  @override
  State<FilmRater> createState() => _FilmRaterState();
}

class _FilmRaterState extends State<FilmRater> {
  
  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.film2,
      routes: {
        Routes.film2:(context) => Film2(),
        Routes.listen:(context) => Listen(),
      },
      home:const Film2()  );

  }
}

  // This widget is the root of your application.
  