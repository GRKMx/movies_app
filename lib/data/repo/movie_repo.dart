import 'package:movies_app/data/entity/movie.dart';

class MovieRepository {

  Future<List<Movie>> loadMovies() async {
    var moviesList = <Movie>[];
    var m1 = Movie(id: 1, name: "Django", image: "django.png", price: 24);
    var m2 = Movie(id: 2, name: "Django", image: "django.png", price: 24);
    moviesList.add(m1);
    moviesList.add(m2);
    return moviesList;
  }
}