import 'package:flutter/material.dart';
class UserModel{

  String? Unom;
  String ? Uadresse;
  String ? Uprenom;
 String ? Uimage;

  UserModel({

     this.Unom,
    this.Uadresse,
    this.Uprenom,
     this.Uimage,
});
 UserModel.fromJson(Map<String ,dynamic>json){

  Uadresse=json['adresse'];
  Uimage=json['image'];
  Unom=json['nom'];
  Uprenom=json['prenom'];
}
}