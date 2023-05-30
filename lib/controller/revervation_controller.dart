import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> enregistrerReservation(
    String nomUtilisateur,
    String villedepart,
    String villeArriver,
    String heurDepart,
    String prix,
    DateTime date
    ) async {
  try {
    User? utilisateur = _auth.currentUser;

    if (utilisateur != null) {
      DocumentReference reservationsRef = _firestore.collection('reservations').doc(utilisateur.uid);

      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot reservationSnapshot = await transaction.get(reservationsRef);

        Map<String, dynamic> data = reservationSnapshot.data() as Map<String, dynamic>;
        List<dynamic>? reservationsList = data["reservations"];

        // Ajouter la nouvelle réservation à la liste des réservations
        if (reservationsList == null) {
          reservationsList = [];
        }

        reservationsList.add({
          'nom_utilisateur': nomUtilisateur,
          'villedepart': villedepart,
          'villeArriver': villeArriver,
          'heurDepart': heurDepart,
          'prix': prix,
          'date': date.toString(),
        });

        // Mettre à jour les données de la réservation
        transaction.update(reservationsRef, {'reservations': reservationsList});
      });
    }
  } catch (e) {
    print(e.toString());
  }
}