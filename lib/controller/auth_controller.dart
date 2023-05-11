import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxiapp/views/profile_settings.dart';

import '../views/homeScreen.dart';
class AuthController extends GetxController{
String userId='';
var verId='';
int? resendTokenId;
bool phoneAuthCheck= false;
dynamic credentials;

phoneAuth(String phone) async{

  try{
    credentials=null;
      await FirebaseAuth.instance.verifyPhoneNumber(
         phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential)async{
           log('completed');
           credentials =credential;
           await FirebaseAuth.instance.signInWithCredential(credential);
        },
        forceResendingToken: resendTokenId,
        verificationFailed: (FirebaseAuthException e){
           log('Failed');
           if(e.code=='invalid-phone-number'){
             debugPrint('the provided phone number is nit valid.');
           }
        },
        codeSent: (String verificationId, int? resendToken) async{
           log('code send');
           verId=verificationId;
           resendTokenId=resendToken;


        },
        codeAutoRetrievalTimeout: (String verificationId){}

     );
  }catch(e){
    log("Error accured $e");
  }
}
//verifaction otp
verifyOtp(String otpNumber)async {
  log('called');
  PhoneAuthCredential credential=PhoneAuthProvider.credential(
      verificationId: verId,
      smsCode:otpNumber);
  log("logedIn");
  await FirebaseAuth.instance.signInWithCredential(credential);
  Get.to(()=>ProfileSettingScreen());
}

decideRoute(){
  /// setp 1 check user login from firbase
  User? user= FirebaseAuth.instance.currentUser;

  if(user!=null){
    // step 2 check user profile existe
    FirebaseFirestore.instance.collection('users').doc(user.uid).get()
        .then((value){
          if(value.exists){
             // redirect to homescreen
            Get.to(()=>HomeScreen());
          }else{
             Get.to(()=>ProfileSettingScreen());
          }
    });
    

  }
}
}