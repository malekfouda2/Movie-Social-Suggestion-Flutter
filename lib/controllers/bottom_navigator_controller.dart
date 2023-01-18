import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../navpages/homeJoe.dart';
import '../navpages/search.dart';
import '../navpages/watchListScreen.dart';

class BottomNavigatorController extends GetxController {
  var screens = [
    HomeScreen(),
    const SearchScreen(),
  WatchList(),
  ];
  var index = 0.obs;
  void setIndex(indx) => index.value = indx;
}
