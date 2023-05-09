import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/constants/image_string.dart';
import 'package:taxiapp/constants/text_strings.dart';

import '../constants/colors.dart';
import '../widgets/my_drawer_header.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          title: Text(tAppName ,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 15,color:appcolor),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(10),color:Colors.white70,
              ),
              child: IconButton(

                onPressed: (){},icon: Image(image: AssetImage(userIcon),),
              ),
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.menu,size: 30,),color: Colors.black,
            onPressed: (){
          //    Scaffold.of(context).openDrawer();
            },
          ),
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
        body: Container(
             child: Center(
               child: Text("home page"),

             ),
        ),
        
        bottomNavigationBar: NavigationBar(),
      ),
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

