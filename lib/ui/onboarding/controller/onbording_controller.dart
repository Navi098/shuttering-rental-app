

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnbordingController extends GetxController{
  final PageController pageController  = PageController();

  final RxInt currentPage = 0.obs;

  void onPageChanged(int index){
    currentPage.value = index;
  }
}