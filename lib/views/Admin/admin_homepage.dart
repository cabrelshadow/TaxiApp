import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../constants/colors.dart';
class AdminHomePage extends StatefulWidget {
  AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _userCount = 0;
  void SignOut(){
    FirebaseAuth.instance.signOut();
  }
  void initState() {
    super.initState();
    _getUserCount();
  }
  Future<void> _getUserCount() async {
    final usersSnapshot =
    await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      _userCount = usersSnapshot.docs.length;
    });
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
          CircularPercentIndicator(

            radius: 100.0,
            lineWidth: 10.0,
            percent: _userCount / 100,
            center: Text(
              "${_userCount}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            progressColor: Colors.green,
          ),
          SizedBox(height: 20),
          Text(
            "Nombre Total d'utilisateur : $_userCount",
            style: TextStyle(fontSize: 18),
          ),
        ],
      )
    );
  }
}
