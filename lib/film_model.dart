// ignore_for_file: non_constant_identifier_names

class Film {
  final String Title;
  final int Year;
  final String Rated;
  final String Released;
  final String Runtime;
  final String Poster;

  //from rating class 

  
  final List<Rating> ratings;

  Film(
      {required this.Poster,
      required this.Rated,
      required this.Released,
      required this.Runtime,
      required this.Title,
      required this.Year,
      required this.ratings
      });

  factory Film.fromMap(Map<String, dynamic> filmMap) {
    return Film(
        Poster: filmMap["Poster"],
        Rated: filmMap["Rated"],
        Released: filmMap["Released"],
        Runtime: filmMap["Runtime"],
        Title: filmMap["Title"],
        Year: int.parse(filmMap["Year"]),
        ratings: Rating.setRatings(filmMap["Ratings"])
        );
  }
}

class Rating {
  final String Source;
  final String Value;

  Rating({required this.Source, required this.Value});
// to goin to the class film
  factory Rating.fromMap(Map<String, dynamic> ratingMap) {
    return Rating(
        Source: ratingMap["Source"], Value: ratingMap["Value"]);
  }

   static List<Rating> setRatings(List ratingMaps )
  {
    return ratingMaps.map((e) => Rating.fromMap(e)).toList();
  }
}

