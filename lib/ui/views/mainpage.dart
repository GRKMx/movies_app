import 'package:flutter/material.dart';
import 'package:movies_app/data/entity/movie.dart';
import 'package:movies_app/ui/views/detailpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Future<List<Movies>> loadMovies() async {
    var moviesList = <Movies>[];
    var m1 = Movies(id: 1, name: "Django", image: "django.png", price: 24);
    var m2 = Movies(id: 2, name: "Django", image: "django.png", price: 24);
    moviesList.add(m1);
    moviesList.add(m2);
    return moviesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies"),),
      body: FutureBuilder<List<Movies>>(
        future: loadMovies(),
        builder: (context,snapshot){
          if(snapshot.hasData) {
            var movieList = snapshot.data;
            return GridView.builder(
              itemCount: movieList!.length,
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
                        Image.asset("images/${movie.image}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${movie.name} ₺",style: const TextStyle(fontSize: 24),),
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
