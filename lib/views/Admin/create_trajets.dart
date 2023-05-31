import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';


class CreateTrajet extends StatefulWidget {
  const CreateTrajet({Key? key}) : super(key: key);

  @override
  State<CreateTrajet> createState() => _CreateTrajetState();
}

class _CreateTrajetState extends State<CreateTrajet> {
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  TextEditingController villdDepartController = TextEditingController();
  TextEditingController VilleArriverController = TextEditingController();
  TextEditingController HeurDepartController = TextEditingController();
  TextEditingController PrixController = TextEditingController();
  TextEditingController DateVoyageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height*0.4,
              child: Stack(
                children: [
                Container(
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/r.png'),
                        fit: BoxFit.fill
                    )
                ),
                height:250,
                child: Container(
                  height: Get.height*0.1,
                  width: Get.width,
                  margin: EdgeInsets.only(bottom: Get.height*0.05),
                  child: Center(
                    child: Text("creer un trajet",
                      style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ),
              )




                ],
              ),
            ),
            SizedBox(
              height: 20,

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child:Form(

                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFieldWidget('ville de depart',  Icons.villa_rounded, villdDepartController,(String? input){
                        if(input!.isEmpty){
                          return "le champs nom est obligatoir";
                        }
                        if(input.length<3){
                          return"le nom ne peut pas etre 2 caractaire minimum 3";
                        }
                        return null;
                      }),
                      SizedBox( height: 10),

                      TextFieldWidget('ville arrivé',  Icons.villa_rounded, VilleArriverController,(String? input){
                        if(input!.isEmpty){
                          return "le champs prenom est obligatoir";
                        }
                        return null;
                      }),
                      SizedBox( height: 10),

                      TextFieldWidget('heur de depart',  Icons.timelapse_sharp, HeurDepartController,(String,input){
                        if(input!.isEmpty){
                          return "le champs ville de residance  est obligatoir";
                        }
                        return null;
                      }),
                      TextFieldWidget('prix',  Icons.price_change, PrixController,(String,input){
                        if(input!.isEmpty){
                          return "le champs ville de residance  est obligatoir";
                        }
                        return null;
                      }),
                      TextFieldWidget('date du voyage',  Icons.price_change, DateVoyageController,(String,input){
                        if(input!.isEmpty){
                          return "le champs ville de residance  est obligatoir";
                        }
                        return null;
                      }),
                      SizedBox( height: 10),


                      SizedBox( height: 30),

                      isLoading?Center(
                        child:CircularProgressIndicator(),
                      ) : greenButton('Enregistrer',(){

                        SaveTrajetInfo();


                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  SaveTrajetInfo()async{

   // String uid=FirebaseAuth.instance.currentUser!.uid;
    showDialog(context: context, builder:(context){
      return Center(
        child: CircularProgressIndicator(),
      );
    });
    FirebaseFirestore.instance.collection('trajets').add({

      'villeDepart':villdDepartController.text,
      'villeArriver':VilleArriverController.text,
      'heurDepart':HeurDepartController.text,
      'Prix':PrixController.text,
      'Datevoyage':DateVoyageController.text,


    }).then((value){
      villdDepartController.clear();
      VilleArriverController.clear();
      HeurDepartController.clear();
      PrixController.clear();
      DateVoyageController.clear();



      Navigator.pop(context);
      _successsMessage(context);
    });
  }
  bool isLoading=false;
  @override
  TextFieldWidget(
      String title, IconData iconData, TextEditingController controller,Function validator) {
    //Function validator,{Function? onTap,bool readOnly = false}
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
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
            //appel de la function validator passer en parametre
            validator:(input)=>validator(input),
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffA7A7A7)),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: AppColors.greenColor,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
  _successsMessage(BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Container(
          padding: EdgeInsets.all(8),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(children: [
            Icon(Icons.check_circle,color: Colors.white,size: 40,),
            SizedBox(width: 20,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Succès",style: GoogleFonts.poppins(),),
                Spacer(),
                Text("trajet creer avec succes!",style: GoogleFonts.poppins(),),
              ],
            ))
          ],),
        )
        ,behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration:Duration(seconds: 4),
            dismissDirection: DismissDirection.vertical


        )
    );
  }
  Widget greenButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.greenColor,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }



}



