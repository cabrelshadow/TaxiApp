import 'package:get/get.dart';
import 'package:taxiapp/views/home.dart';
import 'package:taxiapp/views/navbar.dart';
import 'package:taxiapp/views/trajet.dart';
import 'package:taxiapp/views/trajetdisponible.dart';
import 'package:taxiapp/views/users.dart';

import '../views/homeScreen.dart';
class AppPage{
  static List<GetPage> routes=[
    GetPage(name: navbar, page: ()=> const NavBar()),
    GetPage(name: home, page: ()=> const HomeScreen()),
    GetPage(name: trajetdisponible, page: ()=> const Trajet()),
    GetPage(name: user, page: ()=> const UserPage()),
  ];
  static getnavbar()=>navbar;
  static gethome()=>home;
  static gettrajet()=>trajetdisponible;
  static getuser()=>user;

  static String navbar='/';
  static String home='/home';
  static String trajetdisponible='/trajetdisponible';
  static String user='/user';
}