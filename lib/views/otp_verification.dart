import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/controller/auth_controller.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/green_intro_wiget.dart';
import '../widgets/opt_verification_widget.dart';
import '../widgets/pinput_widget.dart';
import '../widgets/text_wiget.dart';
import 'Admin/chart.dart';
class OtpVerificationScreen extends StatefulWidget {
  String phoneNumber;
  OtpVerificationScreen(this.phoneNumber);


  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  @override
AuthController authController=Get.put(AuthController());

  void initState(){
    super.initState();
    authController.phoneAuth(widget.phoneNumber);

  }


  Widget build(BuildContext context) {

    return Scaffold(

      body:

      SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                greenIntrWigget(),
//possitionement du arrow back
                Positioned(
                 top: 60,left: 30,

                  child: InkWell(
                    onTap:(){
                     Get.back();
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                       child: Icon(Icons.arrow_back,color: AppColors.greenColor,size: 22,),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height:40 ,
            ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWiget(text: AppConstants.phoneVerification),
            textWiget(
                text: AppConstants.enterOtp,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            SizedBox(
              height: 40,
            ),
            RoundedWithShadow(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            child: Countdown(),
            )
          ],
        ),
      )

          ],
        ),
      ),
    );
  }
}
