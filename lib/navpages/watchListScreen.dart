import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/api/api.dart';
import '../api/api.dart';
import '../services/movies_service.dart';
import '../services/watchlist.dart';
import 'details_screen.dart';

class WatchList extends StatelessWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var indx=Get.find<watchList>().indx;
    return Obx(() => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(34.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      tooltip: 'Back to home',
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Watch list',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 33,
                      height: 33,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (Get.find<watchList>().watchListMovies.isNotEmpty)
                  ...Get.find<watchList>().watchListMovies.map(
                        (movie) => Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsScreen(movie:movie,index: indx) ),
                  ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                     'https://image.tmdb.org/t/p/w500/${movie.results![indx]!.posterPath}',
                                      height: 180,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.broken_image,
                                        size: 120,
                                      ),
                                      loadingBuilder: (_, __, ___) {
                                        if (___ == null) return __;
                                        return const FadeShimmer(
                                          width: 120,
                                          height: 180,
                                          highlightColor: Color(0xff22272f),
                                          baseColor: Color(0xff20252d),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                    Container(
                                      child: Text(
                                          movie.results![indx]!.originalTitle.toString()),
                                    ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                if (Get.find<watchList>().watchListMovies.isEmpty)
                  Column(
                    children: const [
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        'No movies in your watch list',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
