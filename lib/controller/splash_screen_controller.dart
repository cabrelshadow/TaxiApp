import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/routes/verifie_user_login.dart';
import 'package:taxiapp/views/on_boarding/on_boarding_screen.dart';

import '../views/login_screen.dart';






class SplashScreenController extends GetxController{
  static SplashScreenController  get find => Get.find();
  RxBool  animate=false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
animate.value =true;
    await Future.delayed(Duration(milliseconds: 3000));
    Get.to(OnBoardingScreen());
//Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomePage(),);
  }
}

