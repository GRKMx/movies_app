import 'package:flutter/material.dart';
import 'package:movies_app/data/entity/movie.dart';

class DetailPage extends StatefulWidget {
  Movie movie;
  DetailPage({required this.movie});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.name),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("http://kasimadalan.pe.hu/filmler_yeni/resimler/${widget.movie.image}"),
            Text("${widget.movie.price} ₺",style: const TextStyle(fontSize: 50),),
          ],
        ),
      ),
    );
  }
}
