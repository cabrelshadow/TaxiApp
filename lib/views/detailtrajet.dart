import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/views/sierge.dart';
import 'package:taxiapp/views/test.dart';

import '../constants/colors.dart';
import '../controller/auth_controller.dart';
import '../controller/revervation_controller.dart';
import '../models/trajetmodels/trajetmodel.dart';

class DetailTrajet extends StatefulWidget {

  final  Trajet trajet;
 DetailTrajet({Key? key, required this.trajet,}) : super(key: key);

  @override
  State<DetailTrajet> createState() => _DetailTrajetState();



}

class _DetailTrajetState extends State<DetailTrajet> {
  get  index => null;
  AuthController authController= Get.find<AuthController>();
  @override
  void initState(){
    super.initState();
    authController.getUser();

  }
  Widget build(BuildContext context) {

    var villedepart= widget.trajet.villeDepart;
    var villeArriver= widget.trajet.villeArrivee;
    var heurDepart= widget.trajet.heureDepart;
    var prix= widget.trajet.prix;
     var nomclient=authController.myuser.value.Unom;
    DateTime date=DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("detail trajet  " ,style: GoogleFonts.poppins( fontSize: 16),),
      ),
      body:  Column(

        children: [
          Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Text("les details du ticket sont fornis lors de la selection du ticket",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: appcolor,
                    fontSize:15
                ),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 70,horizontal:20 ),

            height: 450,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Ville de départ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Ville d\'arrivée', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.trajet.villeDepart, style:GoogleFonts.poppins( fontSize: 14)),
                    Text(widget.trajet.villeArrivee, style:GoogleFonts.poppins( fontSize: 14)),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Heure de départ: ${widget.trajet.heureDepart}', style:GoogleFonts.poppins( fontSize: 14)),
                    Text('${widget.trajet.prix} Fcfa',  style:GoogleFonts.poppins( fontSize: 14)),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    // Générer 10 nombres aléatoires

                    Text('Siège Numero :',style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('${RandomNumberGenerator.generateRandomNumber().toString()}', style:GoogleFonts.poppins( fontSize: 14)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [


                    // Générer 10 nombres aléatoires

                    Text('Nom du client :',style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('${authController.myuser.value.Unom?? ""}', style:GoogleFonts.poppins( fontSize: 14)),
                  ],
                ),
                SizedBox(height: 40,),
                isLoading?Center(
                  child:CircularProgressIndicator( color: appcolor,),
                ) : greenButton('Enregistrer',(){

                  setState(() {
                    isLoading=true;
                  });
                  storeUserInfo();
                }),
              ],
            ),

          ),


        ],
      ),
    );
  }
  storeUserInfo()async{
    DateTime date=DateTime.now();
    String uid=FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('ClientReservation').doc(uid).set({
      'nom_utilisateur':authController.myuser.value.Unom,
      'villedepart':widget.trajet.villeDepart,
      'villeArriver':widget.trajet.villeArrivee,
      'heurDepart': widget.trajet.heureDepart,
      'prix': widget.trajet.prix,
      'date': date.toString(),

    }).then((value){


      setState(() {
        isLoading=false;
      });
       _successsMessage(context);

    });
  }
  bool isLoading=false;

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
    color: appcolor,
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );

}
class RandomNumberGenerator {
  static final _random = Random();
  static final Set<int> _generatedNumbers = {};

  static int generateRandomNumber() {
    int randomNumber;

    do {
      randomNumber = _random.nextInt(50) + 1;
    } while (_generatedNumbers.contains(randomNumber));

    _generatedNumbers.add(randomNumber);

    return randomNumber;
  }

}


