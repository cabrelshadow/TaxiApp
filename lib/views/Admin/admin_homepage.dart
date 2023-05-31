import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AdminHomePage extends StatelessWidget {
  AdminHomePage({Key? key}) : super(key: key);
  void SignOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("admin page",style: GoogleFonts.poppins( fontWeight: FontWeight.bold),),
        centerTitle: true,
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
