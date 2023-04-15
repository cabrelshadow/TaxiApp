import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colors.dart';
import '../widgets/green_intro_wiget.dart';
import '../widgets/opt_verification_widget.dart';
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
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
            OptVerificationWidget(),

          ],
        ),
      ),
    );
  }
}
