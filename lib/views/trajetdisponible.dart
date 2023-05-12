import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/constants/image_string.dart';
import 'package:taxiapp/models/trajetmodels/trajetmodel.dart';

import '../constants/colors.dart';
class Trajet extends StatelessWidget {
  const Trajet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text("Trajet" ,style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20,color:appcolor),),
        ),

        body: SingleChildScrollView(
           child: Container(
             padding: EdgeInsets.only(top: 20),
               child: Column(
                 children: [

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
                           blurRadius: 2,
                           color: Colors.black.withOpacity(0.2),
                         )
                       ],
                       color:appcolor,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,

                       children: [
                         Column(

                           children: [ Text("depart ",style: GoogleFonts.poppins(
                               color: Colors.white,
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
                   SizedBox(height: 10,),
                  SizedBox(
                    height:Get.height,

                     child:  ListView.builder(
                         padding: EdgeInsets.all(10),
                         shrinkWrap: true,
                         scrollDirection: Axis.vertical,
                         itemCount:trajetlistitem.length,
                         itemBuilder: (context,index){
                           return Card(
                              color:appcolor,
                             child: Container(
                               padding: EdgeInsets.symmetric(vertical: 20),
                               height: 180,
                               width: 300,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     bottomRight: Radius.circular(50)
                                   ),
                                   boxShadow: [
                                     BoxShadow(

                                         offset: Offset(0,3),
                                         blurRadius: 2,
                                         color: Colors.black.withOpacity(0.2)
                                     ),

                                   ],
                                   color: Colors.white
                               ),
                               child: Row(

                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(20),

                                              child:Column(
                                                  children: [
                                                    Text(trajetlistitem[index].villeDepart,style: GoogleFonts.roboto(
                                                      fontSize: 15,

                                                    ),),
                                                    SizedBox(height: 10,),


                                                  ]
                                              ) ,
                                            )
                                          ],
                                        ),
                                   Container(
                                     margin: EdgeInsets.all(3),
                                     child: Column(
                                       children: [
                                        Image(image: AssetImage(flech))
                                       ],
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.all(20),
                                     child: Column(
                                         children: [
                                           Text(trajetlistitem[index].villeArriver,style: GoogleFonts.roboto(
                                             fontSize: 15,

                                           ) ),


                                           SizedBox(height: 10,),
                                           Text(trajetlistitem[index].villeArriver,style: GoogleFonts.roboto(
                                             fontSize: 15,

                                           ) ),
                                         ]
                                     ),
                                   ),

                                 ],
                               ),
                             ),
                           );
                         }

                     ) ,
                   ),


                 ],
               ),
           ),
        ),
      ),
    );
  }
}
