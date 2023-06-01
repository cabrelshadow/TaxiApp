import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
class AdminHomePage extends StatelessWidget {
  AdminHomePage({Key? key}) : super(key: key);
  void SignOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("admin" ,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 15,color:appcolor),),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed:(){SignOut();}, icon:Icon( Icons.logout_outlined))
        ],

      ),

      body: Column(
        children: [
          Center( child: Text("login",style:  GoogleFonts.poppins( fontWeight: FontWeight.bold),),)
        ],
      )
    );
  }
}
