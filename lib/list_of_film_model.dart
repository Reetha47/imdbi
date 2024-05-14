class List_film {
  String Title;

  String Year;
  String Type;
  String Poster;

  List_film(
      {required this.Poster,
      required this.Title,
      required this.Type,
      required this.Year});

  factory List_film.fromMap(Map<String, dynamic> reetha) {
    return List_film(
        Poster: reetha["Poster"],
        Title: reetha["Title"],
        Type: reetha["Type"],
        Year: reetha["Year"]);
  }
}
