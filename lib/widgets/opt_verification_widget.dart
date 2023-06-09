import 'dart:ffi';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/utils/app_constants.dart';
import 'package:taxiapp/widgets/pinput_widget.dart';
import 'package:taxiapp/widgets/text_wiget.dart';

import '../views/Admin/chart.dart';
import '../views/otp_verification.dart';

Widget  OptVerificationWidget() {
  return Padding(
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

            )
          ],
        ),
      );
}
