import 'dart:convert';

import 'package:http/http.dart'as http;
import '../api/api.dart';
import '../api/review.dart';

class MoviesServices
{
  getOrganizations()async {
    var Client=http.Client();
    var uri=Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=e965ab933b79c9c1fa2fef794e0c96df&language=en-US&page=1");
    var response=await Client.get(uri);
    if(response.statusCode==200){
      return Movie.movieFromJson(response.body);
    }
  }

  static Future<List<Movie>?> getTopRatedMovies() async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=e965ab933b79c9c1fa2fef794e0c96df&language=en-US&page=1'));
      var res = json.decode(response.body);
      res['results'].skip(6).take(5).forEach(
            (m) => movies.add(
              Movie.fromMapMovie(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  getNowPlayingMovies()async {
    var Client=http.Client();
    var uri=Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=e965ab933b79c9c1fa2fef794e0c96df&language=en-US&page=1");
    var response=await Client.get(uri);
    if(response.statusCode==200){
      return Movie.movieFromJson(response.body);
    }
  }

  getPopularMovies()async {
    var Client=http.Client();
    var uri=Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=e965ab933b79c9c1fa2fef794e0c96df&language=en-US&page=1");
    var response=await Client.get(uri);
    if(response.statusCode==200){
      return Movie.movieFromJson(response.body);
    }
  }

  static Future<List<Review>?> getMovieReviews(int movieId) async {
    List<Review> reviews = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/389/reviews?api_key=e965ab933b79c9c1fa2fef794e0c96df&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (r) {
          reviews.add(
            Review(
                author: r['author'],
                comment: r['content'],
                rating: r['author_details']['rating']),
          );
        },
      );
      return reviews;
    } catch (e) {
      return null;
      
    }
  }
  
  static Future<List<Movie>?> getSearchedMovies(String query) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/movie?api_key=e965ab933b79c9c1fa2fef794e0c96df&language=en-US&query=$query&page=1&include_adult=false'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (m) => movies.add(
          Movie.fromMapMovie(m),
        ),
      );
      return movies;
    } catch (e) {
      return null;
    }
  }

}