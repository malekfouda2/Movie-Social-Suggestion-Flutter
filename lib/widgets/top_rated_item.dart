import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api/api.dart';
import '../navpages/details_screen.dart';

class TopRatedItem extends StatelessWidget {
  const TopRatedItem({
    Key? key,
    required this.movie,
    required this.index
  }) : super(key: key);

  final Movie movie;
  final int  index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsScreen(movie:movie,index: index) ),
                  );
                },
      child: Container(
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
                              ),
    );
  }
}