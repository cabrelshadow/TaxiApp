import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taxiapp/views/otp_verification.dart';
import 'package:taxiapp/widgets/loginwiget.dart';

import '../widgets/green_intro_wiget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode countryCode =
      CountryCode(name: 'cameroon', code: 'cm', dialCode: '+237');


          onSubmit(String? input){
            Get.to(()=>OtpVerificationScreen(countryCode.dialCode+input!));
          }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              greenIntrWigget(),
              SizedBox(
                height: 50,
              ),
              LogingWiget(countryCode, () async {
                final code = await countryPicker.showPicker(context: context);
                if (code != null) countryCode = code;
                setState(() {});
              },onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
