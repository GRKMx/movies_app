import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movies_app/data/entity/movie.dart';
import 'package:movies_app/data/entity/movie_response.dart';

class MovieRepository {

  List<Movie> parseMovies(String response){
    return MovieResponse.fromJson(json.decode(response)).movieList;
  }

  Future<List<Movie>> loadMovies() async {
    var url = "http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php";
    var response = await Dio().get(url);
    return parseMovies(response.data.toString());
  }
}