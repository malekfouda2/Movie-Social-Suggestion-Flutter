import 'package:get/get.dart';
import 'package:movies_app/services/movies_service.dart';
import '../api/api.dart';

class watchList extends GetxController{
   var isLoading = false.obs;
  var mainTopRatedMovies = <Movie>[].obs;
  var watchListMovies = <Movie>[].obs;
  var indx=0;

  @override
  void onInit() async {
    isLoading.value = true;
    mainTopRatedMovies.value = (await MoviesServices.getTopRatedMovies())!;
    isLoading.value = false;
    super.onInit();
  }

  bool isInWatchList(Movie movie,int index) {
    return watchListMovies.any((m) => m.results![index]!.id == movie.results![index]!.id);
  }

  void addToWatchList(Movie movie,int index) {
    if (watchListMovies.any((m) => m.results![index]!.id == movie.results![index]!.id)) {
      watchListMovies.remove(movie);
      Get.snackbar('Success', 'removed from watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    } else {
      watchListMovies.add(movie);
      indx=index;
      Get.snackbar('Success', 'added to watch list',
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500));
    }
  }
}