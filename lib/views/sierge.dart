import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/controller/sierge_controller.dart';

import '../constants/colors.dart';
import '../constants/image_string.dart';
import '../models/trajetmodels/trajetmodel.dart';
class Sierge extends GetView<SierGeController>{


  @override
SierGeController controller =Get.put(SierGeController());
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(bgplace),
            )
        ),
      ),
      SafeArea(
        child: Column(
          children: [
            SizedBox(height: context.mediaQueryPadding.top,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 100,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("choisissez votre \nplace",style:GoogleFonts.roboto(
                      fontWeight:FontWeight.bold,
                      fontSize: 18
                  ),),
                  Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("faites le bon choix",style:GoogleFonts.roboto(

                          fontSize: 16
                      ),),
                      Text("Bus 1-EF2",style:GoogleFonts.roboto(
                        fontWeight:FontWeight.bold,
                        fontSize: 13,
                        color: appcolor,
                      ),)
                    ],
                  ),

                ],
              ),


            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 50,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  ItemeStatus(
                    status:"Disponible" ,
                    color:Colors.white,
                  ),
                  ItemeStatus(
                    status:"Plein" ,
                    color: Color(0xFFda4d10),
                  ),
                  ItemeStatus(
                    status:"Selectioner" ,
                    color: appcolor,
                  ),
                ],
              ),

            ),
            SizedBox(height:10 ,),
            Expanded(
              child: Container(
                height: 100,

                decoration: BoxDecoration(
                  borderRadius:BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),

                  ),
                  color: Colors.white.withOpacity(0.6),
                ),
                child: Column(

                  children: [
                    SizedBox(height: 19,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bus" ,style: GoogleFonts.poppins( fontWeight: FontWeight.bold,fontSize: 18), ),

                          Expanded(

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Text("A",style: GoogleFonts.poppins( fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("B",style: GoogleFonts.poppins( fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("C",style: GoogleFonts.poppins( fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("D",style: GoogleFonts.poppins( fontWeight: FontWeight.bold,fontSize: 15),),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                          Container(

                          width:60 ,

                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(

                              children:List.generate(
                            2,
                                (index) =>Obx(()=>GestureDetector(
                                  onTap: (){
                                      controller.gantiGerbon(index);
                                  },
                                  child: Container(
                              height:150,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.indexGerbon.value==index?appcolor:Colors.white,
                                  border: Border.all(
                                    color: Colors.black54
                                  )
                              ),
                              child:  Center(child: Text("${index+1}",style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold
                              ),)),
                            ),
                                ),

                          ),
                        ),
                      ),
                    )
                          ),
                    SizedBox(width: 15,),
                    Expanded(child: Container(

                      color: Colors.white,

                      child:Obx(
                              ()=> GridView.builder(
                                padding:EdgeInsets.all(10) ,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 5,
                                ),
                                itemCount:controller.gerbon[controller.indexGerbon.value].length ,
                                itemBuilder:(context, index)=>        GestureDetector(
                                  onTap: (){
                                    controller.SelectPlace(index);
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,

                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(15),
                                      color:
                                      controller.gerbon[controller.indexGerbon.value][index]["status"]=="avialable"
                                      ?Colors.white:
                                      controller.gerbon[controller.indexGerbon.value][index]["status"]=="filled"?
                                      Colors.deepOrange:appcolor,
                                    ),


                                  ),
                                ),

                              )

                      )
                    ) ,
                    )
                          ],
                ),
              ),
            ),
            SizedBox(height: 10,)

          ],
        ),

      ),

    ),
    Container(
    height: 50,

    child:Center(
    child: ElevatedButton(
    onPressed: (){},
    style: ElevatedButton.styleFrom(
    backgroundColor: appcolor,
    fixedSize: Size(Get.width *0.9, 50),

    ),
    child: Text("Enregister votre sierge",style:GoogleFonts.poppins(
    fontSize: 16,

    ),),

    ),
    ),


    ),
    SizedBox(height: 10,)
    ],
    ),
    )
    ],
    ),
    );
  }

}
class ItemeStatus extends StatelessWidget {
  ItemeStatus ({
    super.key,
    required this.status,
    required this.color,
  });
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 25,
          width: 25,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: color
          ),

        ),
        SizedBox(width: 7,),
        Text(status,style: GoogleFonts.roboto(
          fontSize: 16,
        ),)
      ],
    );
  }
}
