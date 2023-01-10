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
  Movie movie = Movie();
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    movie = await MoviesServices().getOrganizations();
    if (movie.results != null) {
      setState(() {
        isLoaded = true;
        print(movie.page);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: const Text("Movies Page"),
        ),
        body:
        (movie.results?.length != null)?
        ListView.builder(
          itemCount: movie.results?.length ?? 0,
          itemBuilder: (context, index) => ListTile(
            leading: Image.network('https://image.tmdb.org/t/p/w500/'+movie.results![index]!.posterPath.toString()),
            title: Text(movie.results![index]!.originalTitle.toString()),
            subtitle: Text(movie.results![index]!.overview.toString()),
          ),
          ) : const Center(child: CircularProgressIndicator(),)
        );
  }
}
