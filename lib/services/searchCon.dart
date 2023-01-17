import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../api/api.dart';
import '../services/movies_service.dart';

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var foundedMovies = <Movie>[].obs;
  var isLoading = false.obs;
  void search(String query) async {
    isLoading.value = true;
    foundedMovies.value = (await MoviesServices.getSearchedMovies(query)) ?? [];
    isLoading.value = false;
  }
}
