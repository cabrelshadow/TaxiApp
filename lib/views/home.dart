import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/constants/image_string.dart';
import 'package:taxiapp/constants/text_strings.dart';
import 'package:taxiapp/views/trajet.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../widgets/my_drawer_header.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(tAppName ,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 15,color:appcolor),),
          centerTitle: true,
          elevation: 2,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),

              child: IconButton(

                onPressed: (){
                  Get.to(TrajetList());
                },icon: Image(image: AssetImage(userIcon),),
              ),
            )
          ],

        ) ,
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDrawer(),
                  MyDrawerList1(),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello",style: GoogleFonts.montserrat( fontSize: 16),),
                Text(tDashoardHeading,style: GoogleFonts.montserrat( fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: tDashboardPadding,),
                Container(
                  height: 150,
                  width: 410,

                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,3),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage(bus)),
                      Container(
                        padding:EdgeInsets.only(top: 20),
                        width: 150,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("reduction sur les  de 50%",style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.black                    ),textAlign: TextAlign.center,),
                            SizedBox(height: 2,),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(onPressed: (){

                              },

                                  style: ElevatedButton.styleFrom(
                                      foregroundColor:Colors.white,
                                      backgroundColor: appcolor
                                  ),
                                  child: Text(tDashboardBannerButton,style: GoogleFonts.poppins(fontSize: 15),)
                              ),
                            ),

                          ],

                        ),
                      )

                    ],
                  ),

                ),
                SizedBox(height: 15,),
                Column(
                  children: [

                    Text("Nos services",style: GoogleFonts.poppins( fontSize: 20,),),
                  ],
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 180,
                  width:400 ,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(car),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),

                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,2),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],

                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Text("fdfdfd",style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            )

                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,2),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],

                        ),
                        child: Column(
                          children: [
                            Icon(Icons.bus_alert_outlined,size: 50,color: appcolor,),
                            Text("Bus",style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black ,
                              fontSize:20 ,
                            ),),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        height: 150,
                        width: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,2),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ],

                        ),
                        child: Column(
                          children: [
                            Icon(Icons.bus_alert_outlined,size: 50,color: appcolor,),
                            Text("Bus",style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black ,
                              fontSize:20 ,
                            ),),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),

              ],
            ),

          ),


        ),


        bottomNavigationBar: NavigationBar(),

      );
  }
  Widget MyDrawerList1(){
    return Container();
  }
}

Widget NavigationBar() {
  return Container(
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.transparent.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          selectedItemColor:appcolor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              label: 'home',
              icon: Icon(
                Icons.home_rounded,
                size: 27,
              ),
            ),
            BottomNavigationBarItem(

              label: "Application",
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.more_horiz_outlined,
                  size: 27,
                  color: Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Ticket",
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.airplane_ticket_outlined,
                  size: 27,
                  color: Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "Book",
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.auto_stories_rounded,
                  size: 27,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

