import 'package:movies_app/data/entity/movie.dart';

class MovieResponse {
  List<Movie> movieList;
  int success;

  MovieResponse({required this.movieList,required this.success});

  factory MovieResponse.fromJson(Map<String,dynamic> json){
    var jsonArray = json["filmler"] as List;
    var success = json["success"] as int;

    var movieList = jsonArray.map((e) => Movie.fromJson(e)).toList();
    return MovieResponse(movieList: movieList, success: success);
  }
}