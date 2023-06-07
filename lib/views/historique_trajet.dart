import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../constants/colors.dart';
import '../constants/image_string.dart';

class ReservationWidget extends StatefulWidget {
  const ReservationWidget({super.key});

  @override
  _ReservationWidgetState createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {

  bool _isLoading = true;
  List<Map<String, dynamic>>? _userDataList;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot> _reservations = [];


  @override
  void initState() {
    super.initState();
    displayUserData();
  }
  void _makePayment() async {
    await initializePayment();
    // Traiter la réponse ici
  }
  Future<void> displayUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var userDocs = await FirebaseFirestore.instance.collection('reservations').where('uid', isEqualTo: uid).get();

    if (userDocs.docs.isEmpty) {
      // L'utilisateur n'a pas de réservation enregistrée
      setState(() {
        _isLoading = false;
      });
      return;
    }

    var userDataList = userDocs.docs.map((doc) => doc.data()).toList();
    setState(() {
      _userDataList = userDataList;
      _isLoading = false;
    });
  }
  Future<void> _deleteReservation(String reservationId) async {
    await _firestore.collection('reservations').doc(reservationId).delete();
    setState(() {
      _reservations.removeWhere((reservation) => reservation.id == reservationId);
    });
  }
  Widget buildReservationCard(Map<String, dynamic> reservationData,Function onPressed) {
    return  Container(
      padding: EdgeInsets.all(10),
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
            children: [
              Text('Ville de départ', style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14)),
              Text('Ville d\'arrivée', style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${reservationData['villedepart']}',style:GoogleFonts.poppins( fontSize: 13)),
              Image(image: AssetImage(flech),height: 30,width: 30,),
              Text(' ${reservationData['villeArriver']}', style:GoogleFonts.poppins( fontSize: 13)),
            ],
          ),
          SizedBox(height: 6),
          Divider(color: Colors.grey),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' ${reservationData['heurDepart']}', style:GoogleFonts.poppins( fontSize: 13)),
              Text('${reservationData['prix']} fcfa', style:GoogleFonts.poppins( fontSize: 13)),
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('date du voyage', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
              Text('${reservationData['date']}', style:GoogleFonts.poppins( fontSize: 13)),

            ],
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Numero de siège', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
              Text('${reservationData['numerosierge']}', style:GoogleFonts.poppins( fontSize: 13)),

            ],
          ),
          Divider(color:appcolor),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                _makePayment();

              }, child:Text("valider le ticket",style:
              GoogleFonts.poppins(fontWeight:
              FontWeight.bold,
                color: appcolor,
              ),)),
              TextButton(  onPressed: () => onPressed(), child:Text("annuler",style:
              GoogleFonts.poppins(fontWeight:
              FontWeight.bold,
                color: Colors.red,
              ),))
            ],
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "historique des reservations",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17, color: appcolor),

        ),
        actions: [
          IconButton(onPressed: (){

            displayUserData();

          }, icon: Icon(Icons.refresh),color: appcolor,)
        ],
      ),
      body: _isLoading
          ? Column(
            children: const [
            Center( child: CircularProgressIndicator() , ) ,
            ],
          )
          : (_userDataList == null || _userDataList!.isEmpty
          ? Column(
        children: [
          Container(
            padding: EdgeInsets.only(top:150),
            child: Center(
              child: Text("votre historique est vide !!",style: GoogleFonts.poppins(
                fontSize: 15,
              ),),
            ),
          ),
          Center(
            child: Image(image: AssetImage(notfound),width: 200, height: 200,),
          )
        ],
      )
          : ListView.builder(
        itemCount: _userDataList!.length,
        itemBuilder: (context, index) {
          var userData = _userDataList![index];
       //   String reservationId = _reservations[index].id;

          return Column(
            children: [
              buildReservationCard(userData,(){
                if (userData != null && userData[index] != null) {
                  _deleteReservation(userData[index]);
                }
              }),
              SizedBox(height: 10),
            ],
          );
        },
      )),
    );
  }
  Future<void> initializePayment() async {
    final client = http.Client();

    final Map<String, dynamic> data = {
      "currency": "XAF",
      "amount": 600,
      "description": "Eeasy travel reservation des ticket de pus ",
      "email": "sianou93@gmail.com"
    };

    final response = await client.post(
      Uri.parse('https://api.notchpay.co/payments/initialize'),
      headers: {
        "Authorization": "sb.BFaltHa9yF4wquZBilwvNz0aPMsEKuoZKHi76oHJFLUYrrgWMKbrgziyQQlMMzlAFyHync8bJdSHk4snIlOrTuyOwY3UyUI5fmD0e3nNpqTHe9s2GH3PxiEGW6Dha",
        "Content-Type": "application/json"
      },
      body: json.encode(data),
    );
    if(response==404){

      print("not found");
    }

    // Traiter la réponse ici
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
                Text("paiement effectué avec succes!",style: GoogleFonts.poppins(),),
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
}