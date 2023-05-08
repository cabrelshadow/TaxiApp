import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/controller/splash_screen_controller.dart';

import '../constants/colors.dart';
import '../constants/image_string.dart';
import '../constants/sizes.dart';
import '../constants/text_strings.dart';






class Splashscreen extends StatelessWidget {
   Splashscreen({Key? key}) : super(key: key);
final splashController =  Get.put(SplashScreenController());

  get tDefauldSize => null;
  @override
  Widget build(BuildContext context)  {
        splashController.startAnimation();
    return Scaffold(
     body: Stack(
       children: [
         Obx(
         ()=> AnimatedPositioned(
             duration:const Duration(milliseconds: 1600) ,
             top: splashController.animate.value ? 0 :-30,
               left:splashController.animate.value  ? 0: -30,

               child:  Image.asset(tSplashTopIcon,width: 100,height: 140,),
               ),
         ) ,


         Obx(()=>
            AnimatedPositioned(
             duration:const Duration(milliseconds: 1600) ,
              top: 80,
             left:splashController.animate.value ? tDefauldSize:-80,
             child:AnimatedOpacity(
               duration:const Duration(milliseconds: 1600) ,
               opacity: splashController.animate.value  ? 1 :0,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(tAppName,style: GoogleFonts.poppins(fontSize: 20),),
                   Text(tAppTagligne,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 25),),
                 ],
               ),
             ) ,
           ),
         ),
         Obx(
    ()=> AnimatedPositioned(
             duration:const Duration(milliseconds: 1600) ,
             bottom: splashController.animate.value ? 100: -100,
               child: Image.asset(tSplashImage,width: 400,height: 400,),
               ),
         ) ,
         Obx(
              ()=> AnimatedPositioned(

             duration: const Duration(milliseconds: 1600) ,
             bottom: 80,
             right:splashController.animate.value ? tDefauldSize:-80,
             child: AnimatedOpacity(
               opacity: splashController.animate.value ? 1 :0,
               duration: const Duration(milliseconds: 1600) ,
               child: Container(
                 width: tSplashContainerSize,
                 height: tSplashContainerSize,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(100),
                   color:tPrimaryColor,
                 ),
               ),
             ),
           ),
         )

       ],
     ),

    );
  }
}