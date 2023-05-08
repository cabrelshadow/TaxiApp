import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

Widget  greenIntrWigget(){
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      image:DecorationImage(
          image: AssetImage('assets/r.png'),
              fit: BoxFit.cover,
      )

    ),
    height: Get.height*0.6,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/leaf icon.svg'),
        SizedBox(
         height: 20,

        ),
        SvgPicture.asset('assets/greenTaxi.svg')
      ],
    ),
  );

}
Widget greenIntroWidgetWithoutLogos(){
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/r.png'),
        fit: BoxFit.fill
      )
    ),
    height:250,
    child: Container(
      height: Get.height*0.1,
      width: Get.width,
      margin: EdgeInsets.only(bottom: Get.height*0.05),
      child: Center(
        child: Text("profile Setting",
        style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
    ),
  );
}