import 'package:film_rater/listofmovies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'film_provider.dart';

class Film2 extends StatefulWidget {
  const Film2({super.key});

  @override
  State<Film2> createState() => _Film2State();
}

class _Film2State extends State<Film2> {
  var searchController = TextEditingController();
     
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var filmProvider = Provider.of<FilmProvider>(context, listen: false);
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Film Rater"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBar(
                    controller: searchController,
                    focusNode: FocusNode(),
                    hintText: "Enter the movie title to search",
                    leading: InkWell(
                        onTap: () {
                          filmProvider.getFilm(searchController.text);
                        },
                        child: const Icon(Icons.search)),
                  ),
                ),
              ),
              SizedBox(
                  height: height * 0.7,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child:
                          Consumer<FilmProvider>(builder: (context, data, _) {
                        return data.currentFilm.isNotEmpty
                            ? Card(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: height * 0.5,
                                        width: double.infinity,
                                        child: Image.network(
                                          data.currentFilm[0].Poster,
                                          fit: BoxFit.fill,
                                        )),
                                    Text("title : ${data.currentFilm[0].Year}"),
                                    Text(
                                        "title : ${data.currentFilm[0].Title}"),
                                  ],
                                ),
                              )
                            : const SizedBox();
                      }))),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Listen(),settings: RouteSettings(
                        arguments: searchController.text
                      )),
                    );
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.3,
                    color: Colors.black,
                    child: const Center(
                        child: Text(
                      "See More",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ))
            ],
          ),
        ),
      )
  ;
  }
}