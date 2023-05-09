import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxiapp/constants/image_string.dart';
import 'package:taxiapp/constants/text_strings.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../widgets/my_drawer_header.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _mapStyle;

  @override
  void initState(){
    super.initState();
    rootBundle.loadString('assets/map_style.text').then((String){
      _mapStyle=String;

    });
  }

final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
GoogleMapController? myMapController;
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

                onPressed: (){},icon: Image(image: AssetImage(userIcon),),
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
         body: Scaffold(
           body: GoogleMap(

             onMapCreated: (GoogleMapController controller){
                myMapController=controller;
                myMapController!.setMapStyle(_mapStyle);
             },initialCameraPosition: _kGooglePlex,
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

