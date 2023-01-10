import 'package:http/http.dart'as http;
import '../api/api.dart';

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
}