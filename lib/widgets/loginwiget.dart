import 'dart:ffi';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/utils/app_constants.dart';
import 'package:taxiapp/widgets/text_wiget.dart';

import '../views/otp_verification.dart';

Widget LogingWiget(CountryCode countryCode, Function OnCountryCharged) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWiget(text: AppConstants.helloNiceToMeetYou),
            textWiget(
                text: AppConstants.getMovingWithGreenTaxi,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => OnCountryCharged(),
                    child: Container(
                      child: Row(children: [
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                          child: countryCode.flagImage,
                        )),
                        textWiget(text: countryCode.dialCode),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ]),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 55,
                  color: Colors.black.withOpacity(0.2),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        onTap: (){
                          Get.to(()=>OtpVerificationScreen());
                        },
                        decoration: InputDecoration(
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 13, fontWeight: FontWeight.normal),
                            hintText: AppConstants.enterMobileNumber,
                            border: InputBorder.none),
                      ),
                    ))
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      children: [
                        TextSpan(
                          text: "${AppConstants.byCreating} ",
                        ),
                        TextSpan(
                            text: AppConstants.termsOfService,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: AppConstants.privacyPolicy,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold))
                      ])),
            )
          ],
        ),
      );
}
