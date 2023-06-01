import 'package:cloud_firestore/cloud_firestore.dart';


class HistoriqueModel {
  final String villeDepart;
  final String villeArrivee;
  final String heureDepart;
  final String prix;
  final String dateVoyage;
  final String numerosiege;
  final String nomClient;
  final String dateReserver;

  HistoriqueModel({
    required this.villeDepart,
    required this.villeArrivee,
    required this.heureDepart,
    required this.prix,
    required this.dateVoyage,
    required this.nomClient,
    required this.dateReserver,
    required this.numerosiege,
  });

  factory HistoriqueModel.fromFirestore(DocumentSnapshot document) {
    Map data = document.data() as Map<String, dynamic>;
    return HistoriqueModel(
      villeDepart: data['villeDepart'],
      villeArrivee: data['villeArriver'],
      heureDepart: data['heurDepart'],
      prix: data['Prix'],
      dateVoyage: data['Datevoyage'],
      nomClient: data['nom_utilisateur'],
      dateReserver: data['date'],
      numerosiege: data['numerosierge'],

    );
  }
}
// static Item({required String villeDepart, required String villeArrive, required int prix, required String image, required String heurArrive}) {}
