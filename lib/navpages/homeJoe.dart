import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/mock/http_request_mock.dart';
import 'package:movies_app/api/api.dart';

import '../services/movies_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   Movie movie = Movie();
   Movie nowPlaying = Movie();
   Movie popular = Movie();
  var mainTopRatedMovies = <Movie>[];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    movie = await MoviesServices().getOrganizations();
    mainTopRatedMovies = (await MoviesServices.getTopRatedMovies())!;
    nowPlaying = await MoviesServices().getNowPlayingMovies();
    popular = await MoviesServices().getPopularMovies();
    if (movie.results != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orange,
        title: const Text("Title")
      ) ,
      body: 
        ListView(
          children: [
             SizedBox(
              height: 10,
            ),
           Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  'Now Playing Movies',style: TextStyle(color: Colors.orange,fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                      // color: Colors.red,
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: nowPlaying.results?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              // color: Colors.green,
                              width: 250,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500/'+nowPlaying.results![index]!.posterPath.toString()),
                                          fit: BoxFit.cover),
                                    ),
                                    height: 140,
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Text(
                                        nowPlaying.results![index]!.originalTitle.toString()),
                                  ),

                                  

                                ],
                              ),
                            );

                            

                          }))
                          ]
              ),
           ),


            SizedBox(
              height: 20,
            ),
           Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  'Top Rated Movies',style: TextStyle(color: Colors.orange,fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                      // color: Colors.red,
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.results?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              // color: Colors.green,
                              width: 250,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500/'+movie.results![index]!.posterPath.toString()),
                                          fit: BoxFit.cover),
                                    ),
                                    height: 140,
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Text(
                                        movie.results![index]!.originalTitle.toString()),
                                  ),

                                  

                                ],
                              ),
                            );
                          }))
                          ]
              ),
           ),



            SizedBox(
              height: 10,
            ),
           Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  'Popular Movies',style: TextStyle(color: Colors.orange,fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                      // color: Colors.red,
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popular.results?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              // color: Colors.green,
                              width: 250,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500/'+popular.results![index]!.posterPath.toString()),
                                          fit: BoxFit.cover),
                                    ),
                                    height: 140,
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Text(
                                        popular.results![index]!.originalTitle.toString()),
                                  ),

                                  

                                ],
                              ),
                            );

                            

                          }))
                          ]
              ),
           )

          ],
        ));
  }
}
