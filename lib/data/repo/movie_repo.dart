import 'package:movies_app/data/entity/movie.dart';
import 'package:movies_app/sqlite/database_provider.dart';

class MovieRepository {

  Future<List<Movie>> loadMovies() async {
    var db = await DatabaseProvider.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM movie");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Movie(id: row["id"], name: row["name"], image: row["image"], price: row["price"]);
    });
  }
}