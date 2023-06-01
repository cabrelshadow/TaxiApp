import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/constants/colors.dart';
import 'package:taxiapp/widgets/mybutton.dart';
import 'package:taxiapp/widgets/textField.dart';

import '../../utils/app_colors.dart';
class LoginAdmin extends StatefulWidget {
 LoginAdmin({Key? key}) : super(key: key);

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final usernameController=TextEditingController();

  final passworsController=TextEditingController();

  void signUserin()async{
    showDialog(context: context, builder:(context){
      return Center(
        child: CircularProgressIndicator(),
      );
    });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
           email: usernameController.text,
           password: passworsController.text
       );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50,),

                  Icon(Icons.lock,size: 100,),
                  SizedBox(height: 50,),
                  Text("hello admin", style: GoogleFonts.poppins( fontWeight: FontWeight.bold,fontSize: 16),),
                  SizedBox(height: 25,),
                    MyTextFiled( controller:usernameController , hintText: "nom d'\ utilsateur",obscureText: false,),
                  SizedBox(height: 10,),

                  MyTextFiled(controller:passworsController ,hintText: "Mot de passe",obscureText:true ,),
                  SizedBox(height: 20,),

                  Container(

                    padding: EdgeInsets.all(5),
                    margin:EdgeInsets.symmetric(horizontal: 25) ,
                    child: greenButton("Se connecter", (){
                      signUserin();
                    }),
                  )

                ],
              ),
            ),
          ),
        ),

    );
  }
}
Widget greenButton(String title, Function onPressed) {
  return MaterialButton(
    minWidth: Get.width,
    height: 50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    color: appcolor,
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

