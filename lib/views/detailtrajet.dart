import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/views/sierge.dart';


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
  String _selectedTarif = "Premuim";
  int _selectedNbPersonnes = 1;
  double _prixUnitaire = 5000.0;

  Map<String,double> tarifs = {
    "Business class": 5000.0,
    "Master class": 15000,
    "Premuim": 5000.0
  };
  get  index => null;
  AuthController authController= Get.find<AuthController>();
  @override
  void initState(){
    super.initState();
    authController.getUser();

  }
  void updatePrice(){
    setState(() {
      _prixUnitaire = tarifs[_selectedTarif]!;
    });
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
        backgroundColor: appcolor,
        title: Text("detail trajet  " ,style: GoogleFonts.poppins( fontSize: 16),),
      ),
      body:  SingleChildScrollView(
        child: Column(

          children: [
            Container(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  Text("les details du ticket sont fornis lors de la selection du ticket",style: GoogleFonts.poppins(

                      color: appcolor,
                      fontSize:15
                  ),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 70,horizontal:20 ),

                height: 600,
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

                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: Colors.grey),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('nombre de personne', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        DropdownButton<String>(
                          value: _selectedTarif,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedTarif = newValue!;
                              updatePrice();
                            });
                          },
                          items: tarifs.keys.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(height:20),
                        DropdownButton<int>(
                          value: _selectedNbPersonnes,
                          onChanged: (int? newValue) {
                            setState(() {
                              _selectedNbPersonnes = newValue!;
                            });
                          },
                          items: [1,2,3,4,5,6,7,8].map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text("$value"),
                            );
                          }).toList(),
                        ),
                        SizedBox(height:20),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        // Générer 10 nombres aléatoires

                        Text('Siège Numero :',style:GoogleFonts.poppins( fontSize: 14),),
                        Text('${RandomNumberGenerator.generateRandomNumber().toString()}', style:GoogleFonts.poppins( fontSize: 14)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        // Générer 10 nombres aléatoires

                        Text('Nom du client :',style:GoogleFonts.poppins(fontSize: 14),),
                        Text('${authController.myuser.value.Unom?? ""}', style:GoogleFonts.poppins( fontSize: 14)),
                      ],
                    ),
                    SizedBox(height:10),
                    Divider(color: appcolor,),

                    Text("Prix total : ${_prixUnitaire * _selectedNbPersonnes} FCFA" ,style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 50,),
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
            ),


          ],
        ),
      ),
    );
  }
  storeUserInfo() async {
    DateTime date = DateTime.now();
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // Générer un nouvel identifiant unique pour la réservation
    String reservationId = UniqueKey().toString();

    await FirebaseFirestore.instance
        .collection('reservations')
        .doc(uid)
        .collection('reservations') // Utiliser une sous-collection pour stocker les réservations de l'utilisateur
        .doc(reservationId) // Utiliser l'identifiant unique pour la réservation
        .set({
      'nom_utilisateur': authController.myuser.value.Unom,
      'villedepart': widget.trajet.villeDepart,
      'villeArriver': widget.trajet.villeArrivee,
      'heurDepart': widget.trajet.heureDepart,
      'prix': _prixUnitaire * _selectedNbPersonnes,
      'nombre_personne': _selectedNbPersonnes,
      'type_voyage': _selectedTarif,
      'numerosierge': RandomNumberGenerator.generateRandomNumber().toString(),
      'date': date.toString(),
      'uid': uid,
    })
        .then((_) {
      setState(() {
        isLoading = false;
      });
      _successsMessage(context);
    })
        .catchError((error) {
      print(error);
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


