import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/entity/movie.dart';
import 'package:movies_app/ui/cubit/mainpage_cubit.dart';
import 'package:movies_app/ui/views/detailpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    context.read<MainPageCubit>().loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies"),),
      body: BlocBuilder<MainPageCubit,List<Movie>>(
        builder: (context,movieList){
          if(movieList.isNotEmpty) {
            return GridView.builder(
              itemCount: movieList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1 / 1.8),
              itemBuilder: (context,index){
                var movie = movieList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(movie: movie)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network("http://kasimadalan.pe.hu/filmler_yeni/resimler/${movie.image}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${movie.price} ₺",style: const TextStyle(fontSize: 21),),
                            ElevatedButton(onPressed: (){}, child: const Text("Cart"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
