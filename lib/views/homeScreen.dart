import'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:taxiapp/constants/image_string.dart';
import 'package:taxiapp/constants/text_strings.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:taxiapp/views/trajet.dart';
import '../constants/colors.dart';

import '../widgets/my_drawer_header.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final pages = [
    const HomeScreen(),
    const  TrajetList(),

  ];

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
         body: PageView(

           children: [
             Scaffold(
               body: Stack(
                 children: [
                   GoogleMap(
                     zoomControlsEnabled: false,

                     onMapCreated: (GoogleMapController controller){

                        myMapController=controller;
                        myMapController!.setMapStyle(_mapStyle);
                     },initialCameraPosition: _kGooglePlex,
                   ),

                   builTextField(),
                   builCurrentLocation(),
                 ],

               ),

             ),
           ],
         ),


        bottomNavigationBar: NavigationBar(),

    );
  }




   Widget  builCurrentLocation(){
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8,right: 8),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: appcolor,
          child: InkWell(
            onTap:(){
              Get.snackbar("Votre possition", "Douala Akwa nord");
            },
            child: Icon(Icons.my_location,color: Colors.white,
            ),
          ),),

        ),

    );
  }
   Widget builTextField(){
    return    Positioned(
      top: 40,
      left: 20,
      right: 20,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.only(left: 10),
        // height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          //vallidate imput
          readOnly: true,
          onTap: (){
            showGoogleAutoComplete();
          },
          //appel de la function validator passer en parametre

          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
          decoration: InputDecoration(
            hintText: "rechercher une destination",

            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,

              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );


}
   void   showGoogleAutoComplete()async{
    const kGoogleApiKey="AIzaSyDFNwu1OAxQtCP-cm3rplmIKBHI8SW1SPI";
    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
        radius: 1000,
        strictbounds: false,
        region: "us",
        context: context,
        apiKey: kGoogleApiKey,
      mode: Mode.overlay,
      language: "en",
      components: [new Component(Component.country, "us")],
      types: ["(cities)"],
      hint: "rechercher une ville"
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

