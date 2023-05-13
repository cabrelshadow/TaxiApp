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
                 padding: EdgeInsets.all(10),
                 child: Column(
                   children: [
                     builTextField(),
                     SizedBox( height: 5,),
                        Container(
                            height: MediaQuery.of(context).size.height / 1.40,
                          child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:trajetlistitem.length,
                          itemBuilder: (context,index){
                            return Card(

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Image(image: AssetImage(trajetlistitem[index].image),height: 100,width: 100,),
                                      SizedBox(width: 10,),


                                      Text(trajetlistitem[index].villeDepart,style: GoogleFonts.roboto(
                                        fontSize: 15,

                                      ),),
                                      SizedBox(width: 10,),
                                      Image(image: AssetImage(flech)),
                                      SizedBox(width: 10,),
                                      Text(trajetlistitem[index].villeArriver,style: GoogleFonts.roboto(
                                        fontSize: 15,

                                      ),),


                                    ],

                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Image(image: AssetImage(heur), height: 30,width: 30,),

                                      Text(trajetlistitem[index].heurArriver,style: GoogleFonts.roboto(
                                        fontSize: 15,

                                      ),),


                                      SizedBox(width: 10,),
                                      Text("${trajetlistitem[index].Prix.toString()}"+" "+"fcaf",style: GoogleFonts.roboto(
                                        fontSize: 15,
                                         fontWeight: FontWeight.bold,
                                      ),),


                                    ],

                                  ),
                                  SizedBox(height: 5,),
                                ],

                              ),

                            );
                          },
                        )),

                   ],
                 ),

               ),
             ),
      ),
    );
  }
}
Widget builTextField(){
  return    Positioned(
    top: 20,
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

        onTap: (){

        },
        //appel de la function validator passer en parametre

        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffA7A7A7)),
        decoration: InputDecoration(
          hintText: "rechercher un trajet",

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
