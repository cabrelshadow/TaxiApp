import'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:taxiapp/constants/image_string.dart';
import 'package:taxiapp/constants/text_strings.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:taxiapp/controller/auth_controller.dart';
import 'package:taxiapp/views/trajet.dart';
import '../constants/colors.dart';

import '../constants/possitonGeographique.dart';
import '../widgets/my_drawer_header.dart';
import 'drawerpage.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _getUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('Latitude: ${position.latitude}');
      print('Longitude: ${position.longitude}');
    } catch (e) {
      print(e);
    }
  }


  String? _mapStyle;

  @override
  AuthController authController= Get.find<AuthController>();

  void initState(){
    super.initState();

    rootBundle.loadString('assets/map_style.text').then((String){
      _mapStyle=String;

    });
  }

final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(CamerounDoualaLatitude, CamerounDoualaLongitude),


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
                },icon: Image(image: AssetImage(userIcon),),
              ),
            )
          ],
        ) ,
        drawer:DrawerNavigator(),
         body:SingleChildScrollView(
           child: Column(
             children: [
               SizedBox(height: 10,),
               Container(

                 padding: EdgeInsets.symmetric(vertical: 20),
                 margin: EdgeInsets.symmetric(horizontal: 20),
                 width: 500,
                 height: 100,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: containerColor1,
                   boxShadow: [
                     BoxShadow(
                       color:appcolor.withOpacity(0.5),
                       spreadRadius: 2,
                       blurRadius: 5,
                       offset: Offset(0, 3), // changes position of shadow
                     ),
                   ],

                 ),
                   child: Row(

                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [

                     Image(image: AssetImage(calender) ,width: 60,height: 50,),
                       Column(
                         children: [
                           Text("le confort de nos \n passagés est notre priorité",style: GoogleFonts.poppins(
                             color:Colors.white,

                           ),),
                         ],
                       )
                     ],
                   ),
               ),
               SizedBox(height: 15,),
               Container(
                 margin: EdgeInsets.symmetric(horizontal: 20),
                 width: 500,
                 height: 200,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color:Colors.grey.withOpacity(0.5),
                       spreadRadius: 2,
                       blurRadius: 5,
                       offset: Offset(0, 3), // changes position of shadow
                     ),
                   ],

                 ),
                 child:Stack(
                   children: [
                     GoogleMap(
                       zoomControlsEnabled: false,

                       onMapCreated: (GoogleMapController controller){

                         myMapController=controller;
                         myMapController!.setMapStyle(_mapStyle);
                       },initialCameraPosition: _kGooglePlex,
                     ),
                     builCurrentLocation(),

                   ],
                 ),

               ),
               SizedBox(height: 10,),
               Text("vous pouvez reserver en :",textAlign: TextAlign.start,style: GoogleFonts.poppins(
                 fontWeight: FontWeight.w500
               ),),
               SizedBox(height: 10,),
               Container(
                 padding: EdgeInsets.symmetric(vertical: 50),
                 width: 600,
                 height:260,

                 decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),

                    ),

                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       color:Colors.grey.withOpacity(0.7),
                       spreadRadius: 1,
                       blurRadius: 2,
                       offset: Offset(0, 3), // changes position of shadow
                     ),
                   ],

                 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                            Image(image: AssetImage(business),width: 30,height: 30,),
                              SizedBox(width: 10,),
                              Text("Business class ",style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                              ),),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Image(image: AssetImage(vip),width: 30,height: 30,),
                              SizedBox(width: 10,),
                              Text("Master class",style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19
                              ),),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                             Icon(Icons.star_border,color: appcolor,size: 30,),
                              SizedBox(width: 10,),
                              Text("Premuim",style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19
                              ),),
                            ],
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 200,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(busvip),
                                fit: BoxFit.cover,
                              ),
                            ),

                          )
                        ],
                      )
                    ],
                  ),
               )


             ],
           ),
         ),

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
              _getUserLocation();
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
        region: "cmr",
        context: context,
        apiKey: kGoogleApiKey,
      mode: Mode.overlay,
      language: "en",
      components: [new Component(Component.country, "cmr")],
      types: ["(cities)"],
      hint: "rechercher une ville"
    );
}
  Widget MyDrawerList1(){
    return Container();
  }
}

