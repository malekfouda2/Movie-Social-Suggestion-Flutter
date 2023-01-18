import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/models/movie.dart';

import '../navpages/details_screen.dart';

class TopRatedItem extends StatelessWidget {
  const TopRatedItem({
    Key? key,
    required this.movie,
    required this.index,
  }) : super(key: key);

  final Movie movie;
  final int index;
  @override
  Widget build(BuildContext context) {
                            return GestureDetector(
      onTap: () =>
                      Get.to(
                        DetailsScreen(movie:movie) 
                        ),
      child: Container(
                                padding: const EdgeInsets.all(5),
                                // color: Colors.green,
                                width: 250,
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                Api.imageBaseUrl + movie.posterPath
                                                ),
                                            fit: BoxFit.cover),
                                      ),
                                      height: 140,
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      child: Text(
                                          Api.imageBaseUrl + movie.title,
                                    ),
                                    )
                                  ],
                                ),
                              ),
    );
                     }
}
