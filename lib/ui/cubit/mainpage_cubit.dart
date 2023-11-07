import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/entity/movie.dart';
import 'package:movies_app/data/repo/movie_repo.dart';

class MainPageCubit extends Cubit<List<Movie>> {

  MainPageCubit():super(<Movie>[]);

  var mRepo = MovieRepository();

  Future<void> loadMovies() async {
    var list = await mRepo.loadMovies();
    emit(list);
  }

}