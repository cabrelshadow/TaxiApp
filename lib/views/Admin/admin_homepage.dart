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
  int  _trajetNumber=0;
  void SignOut(){
    FirebaseAuth.instance.signOut();
  }
  void initState() {
    super.initState();
    _getUserCount();
    _getTrajetCount();
  }
  Future<void> _getUserCount() async {
    final usersSnapshot =
    await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      _userCount = usersSnapshot.docs.length;
    });
  }

  Future<void> _getTrajetCount() async {
    final usersSnapshot =
    await FirebaseFirestore.instance.collection('trajets').get();
    setState(() {
      _trajetNumber = usersSnapshot.docs.length;
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

      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tableau de bord ",style: GoogleFonts.roboto( fontSize: 20),),
                  Icon(Icons.dashboard_customize,color: appcolor,size: 30,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(

              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                boxShadow: [
                  BoxShadow(
                    color:appcolor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.amber
              ),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularPercentIndicator(

                    radius: 30.0,
                    lineWidth: 5.0,

                    percent: _userCount / 100,

                    progressColor: Colors.green,
                    backgroundColor: Colors.white,
                    center: Text("$_userCount %",style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    )),

                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "Total d'utilisateur : $_userCount",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),

                      ],
                    ),

                  ),


                ],
              ),
            ),


            SizedBox(height: 20),
            Container(

              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  boxShadow: [
                    BoxShadow(
                      color:appcolor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color:appcolor
              ),
              child:Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Nombre de Trajets  :$_trajetNumber",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.white),),

                      ],
                    ),


                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                        Text("12 %",style: GoogleFonts.roboto(fontWeight: FontWeight.bold),)
                      ],
                    )

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 500,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: containerAD
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Mes traveaux",style: GoogleFonts.roboto( fontWeight: FontWeight.bold,color: Colors.white,
                        fontSize: 20
                      ),)

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("56",style: GoogleFonts.roboto( fontSize: 110,color: Colors.white)),
                      Container(

                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(50),
                          color: Colors.white,

                        ),
                        child: Center(child: Text("+2",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.black),)),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                         child: CircularPercentIndicator(

                           radius: 50.0,
                           lineWidth: 10.0,

                           percent:50 / 100,

                           progressColor: Colors.orange ,
                           backgroundColor: Colors.transparent,
                           center: Text("$_userCount %",style: GoogleFonts.poppins(
                               fontWeight: FontWeight.bold,
                               color: Colors.white
                           )),

                         ),
                      )
                    ],

                  ),
                  Container(
                    width: 320,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Icon(Icons.place_outlined,color:Colors.orange,size: 60,),
                         Text("for free on PC.In this tutorial\n we will provide direct",style: GoogleFonts.roboto(

                         ),)
                       ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
