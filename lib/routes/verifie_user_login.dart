import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:taxiapp/views/login_screen.dart';
import 'package:taxiapp/views/navbar.dart';
class UserAuthVerifie extends StatelessWidget {
  const UserAuthVerifie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context ,snapshot){
              //user is login
              if(snapshot.hasData){
                return NavBar();
              }else{
                return LoginScreen();
              }
            }
        )
    );
  }
}
