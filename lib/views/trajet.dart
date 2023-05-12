import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/text_strings.dart';
class TrajetList extends StatelessWidget {
  const TrajetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("trajet" ,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 17,color:appcolor),),
        centerTitle: false,


        backgroundColor: Colors.white,


      ) ,
      body: SingleChildScrollView(
           child: Container(
             child: Column(
               children: [
                 SizedBox(height: 20,),
                  Container(
                   width: 400,
                    height: 60,
                     padding: EdgeInsets.only(top: 5),
                     margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,3),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.5),
                        )
                      ],
                      color:appcolor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Column(

                          children: [ Text("depart ",style: GoogleFonts.poppins(
                              color: Colors.black,
                                fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),)],
                        ),
                        SizedBox(width: 50,),
                        Icon(Icons.transfer_within_a_station,color: Colors.white,),
                        SizedBox(width: 50,),
                        Column(
                          children: [ Text("arrivé ",style: GoogleFonts.poppins(
                            color: Colors.white,
                             fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),)],
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                 SizedBox(height: 20,),
                Container(
             child: Column(



                  children: [
                    Text("voyages disponibles" ,style: GoogleFonts.montserrat( fontSize: 15 ,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,

                    ),
                    Text("10 places",style: GoogleFonts.montserrat( fontSize: 14),overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
                ),
                 SizedBox(height: 20,),
                 SizedBox(
                   height:Get.height,
                   width:400 ,
                   child: ListView(
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     children: [

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




                     ],
                   ),
                 ),
               ],

             ),

           ),

      ),

    );
  }
}

