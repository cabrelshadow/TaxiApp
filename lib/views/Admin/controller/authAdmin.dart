import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/views/Admin/admin_homepage.dart';
import 'package:taxiapp/views/Admin/loginScreen.dart';
import 'package:taxiapp/views/Admin/navbar.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

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
                  return LoginAdmin();
                }
            }
        )
    );
  }
}
