import 'package:get/get.dart';
import 'package:taxiapp/views/create_trajets.dart';
import 'package:taxiapp/views/home.dart';
import 'package:taxiapp/views/navbar.dart';
import 'package:taxiapp/views/trajet.dart';
import 'package:taxiapp/views/trajetdisponible.dart';
import 'package:taxiapp/views/users.dart';

import '../views/homeScreen.dart';
import '../views/show_trajet.dart';
import '../views/tarifs.dart';
class AppPage{
  static List<GetPage> routes=[
    GetPage(name: navbar, page: ()=>  NavBar()),
    GetPage(name: home, page: ()=> const HomeScreen()),
    GetPage(name: trajetdisponible, page: ()=>  TrajetsListScreen()),
    GetPage(name: user, page: ()=> const UserPage()),
    GetPage(name: Addtrajet, page: ()=>  CreateTrajet()),
    GetPage(name: tarif, page: ()=>  PlaceListPage()),
  ];
  static getnavbar()=>navbar;
  static gethome()=>home;
  static gettrajet()=>trajetdisponible;
  static getuser()=>user;
  static gettarif()=>tarif;

  static String navbar='/';
  static String home='/home';
  static String trajetdisponible='/trajetdisponible';
  static String user='/user';
  static String Addtrajet='/CreateTrajet';
  static String tarif='/tarif';

}