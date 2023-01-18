import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/mock/http_request_mock.dart';
import '../controllers/movies_controller.dart';
import '../models/movie.dart';
import 'package:movies_app/navpages/details_screen.dart';
import '../navpages/search.dart';
import '../api/api.dart';
import '../controllers/bottom_navigator_controller.dart';
import '../controllers/search_controller.dart';
import '../widgets/searchBox.dart';
import '../widgets/top_rated_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final MoviesController controller = Get.put(MoviesController());
  final SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
             const SizedBox(
              height: 10,
            ),

           Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const SizedBox(
              height: 24,
            ),
            SearchBox(
              onSumbit: () {
                String search =
                    Get.find<SearchController>().searchController.text;
                Get.find<SearchController>().searchController.text = '';
                Get.find<SearchController>().search(search);
                Get.find<BottomNavigatorController>().setIndex(1);
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 24,),
                  const Text(
                  'Now Playing Movies',style: TextStyle(color: Colors.orange,fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      height: 200,
                      child:  Obx(() => 
                             ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.nowPlayingMovies.length,
                                itemBuilder: (_, index) {
                                  
                                  return GestureDetector(
                                      onTap: () =>
                                                      Get.to(
                                                        DetailsScreen(movie:controller.nowPlayingMovies[index]) 
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
                                                      Api.imageBaseUrl + controller.nowPlayingMovies[index].posterPath
                                                      ),
                                                  fit: BoxFit.cover),
                                            ),
                                            height: 140,
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            child: Text(
                                                 controller.nowPlayingMovies[index].title,
                                          ),
                                          )
                                        ],
                                      ),
                                    ),
                                    );
                                }
                                   ),
                          )
                        
                      )
                          ]
              ),
           ),
            

const SizedBox(height: 10,),
                  const Text(
                  '  Top Rated Movies',style: TextStyle(color: Colors.orange,fontSize: 25),
                  ),
   const SizedBox(height: 10),
                  Container(
                      height: 200,
                      child:  Obx(() => 
                             ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.mainTopRatedMovies.length,
                                itemBuilder: (_, index) {
                                  
                                  return GestureDetector(
                                      onTap: () =>
                                                      Get.to(
                                                        DetailsScreen(movie:controller.mainTopRatedMovies[index]) 
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
                                                      Api.imageBaseUrl + controller.mainTopRatedMovies[index].posterPath
                                                      ),
                                                  fit: BoxFit.cover),
                                            ),
                                            height: 140,
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            child: Text(
                                                 controller.mainTopRatedMovies[index].title,
                                          ),
                                          )
                                        ],
                                      ),
                                    ),
                                    );
                                }
                                   ),
                          )
                        
                      ),
                    
 


    const SizedBox(height: 10,),
                  const Text(
                  '  Popular Movies',style: TextStyle(color: Colors.orange,fontSize: 25),
                  ),
   const SizedBox(height: 10),
                  Container(
                      height: 200,
                      child:  Obx(() => 
                             ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.popularMovies.length,
                                itemBuilder: (_, index) {
                                  
                                  return GestureDetector(
                                      onTap: () =>
                                                      Get.to(
                                                        DetailsScreen(movie:controller.popularMovies[index]) 
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
                                                      Api.imageBaseUrl + controller.popularMovies[index].posterPath
                                                      ),
                                                  fit: BoxFit.cover),
                                            ),
                                            height: 140,
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            child: Text(
                                                 controller.popularMovies[index].title,
                                          ),
                                          )
                                        ],
                                      ),
                                    ),
                                    );
                                }
                                   ),
                          )
                        
                      )

          ],
        );
  }
}
