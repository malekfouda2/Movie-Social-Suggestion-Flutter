import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/api.dart';
import '../services/movies_service.dart';

class moviesPage extends StatefulWidget {
  const moviesPage({Key? key}) : super(key: key);

  @override
  State<moviesPage> createState() => _moviesPageState();
}

class _moviesPageState extends State<moviesPage> {
  List<Movie> movie = <Movie>[];
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    movie = await MoviesServices().getOrganizations();
    if (movie.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: const Text("Movies Page"),
        ),
        body:ListView.builder(
          itemCount: movie.length,
          itemBuilder: (context, index) => ListTile(
            leading: Image.network(movie[index].posterPath.toString()),
            title: Text(movie[index].title.toString()),
            subtitle: Text(movie[index].overview.toString()),
          ),
          )
        );
  }
}
