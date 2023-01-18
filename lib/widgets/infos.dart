import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/utils/utils.dart';

class Infos extends StatelessWidget {
  const Infos({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              movie.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    movie.voteAverage == 0.0
                        ? 'N/A'
                        : movie.voteAverage.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFFFF8700),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                    height: 5,
                  ),
              Row(
                children: [
                  const Icon(Icons.category),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    Utils.getGenres(movie),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                    height: 5,
                  ),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    movie.releaseDate.split('-')[0],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
