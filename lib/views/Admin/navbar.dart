import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constants/colors.dart';
import 'package:taxiapp/controller/controller.dart';
import 'package:taxiapp/views/Admin/admin_homepage.dart';
import 'package:taxiapp/views/Admin/create_trajets.dart';
import 'package:taxiapp/views/Admin/user_reservation.dart';

import 'package:taxiapp/views/show_trajet.dart';

import 'package:iconly/iconly.dart';

import 'package:taxiapp/views/users.dart';



class NavBar extends StatefulWidget {
   NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller= Get.put(NavbarController());

  @override

  Widget build(BuildContext context) {
   return GetBuilder<NavbarController>(builder: (context){
     return Scaffold(
       body:IndexedStack(
         index: controller.tabIndex,
         children: [
          AdminHomePage(),
           CreateTrajet(),
           ReservationList()

         ],

       ) ,
//navabar working
       bottomNavigationBar:  BottomNavigationBar(
         currentIndex: controller.tabIndex,
         onTap: controller.changeTabIndex,
         selectedItemColor: appcolor,
         unselectedItemColor: Colors.grey,

         items: [
            _bottombarItem(IconlyBold.home, "homePage"),
            _bottombarItem(IconlyBold.arrow_down_circle, "createTrajet"),
            _bottombarItem(IconlyBold.time_circle, "historique reservarion"),

         ],
       ),
     );
   });
  }
}
_bottombarItem(IconData icon,String lable){
  return BottomNavigationBarItem(icon: Icon(icon),label: lable);
}