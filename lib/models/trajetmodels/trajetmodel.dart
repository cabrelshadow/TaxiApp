import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Trajet {
  final String villeDepart;
  final String villeArrivee;
  final String heureDepart;
  final String prix;

  Trajet({
    required this.villeDepart,
    required this.villeArrivee,
    required this.heureDepart,
    required this.prix,
  });

  factory Trajet.fromFirestore(DocumentSnapshot document) {
    Map data = document.data() as Map<String, dynamic>;
    return Trajet(
      villeDepart: data['villeDepart'],
      villeArrivee: data['villeArriver'],
      heureDepart: data['heurDepart'],
      prix: data['Prix'],
    );
  }
}
 // static Item({required String villeDepart, required String villeArrive, required int prix, required String image, required String heurArrive}) {}
