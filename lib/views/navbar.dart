import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxiapp/constants/colors.dart';
import 'package:taxiapp/controller/controller.dart';
import 'package:taxiapp/views/home.dart';
import 'package:taxiapp/views/trajet.dart';
import 'package:iconly/iconly.dart';

import 'homeScreen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

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
         children: const [
           HomeScreen(),
           TrajetList(),
         ],

       ) ,
       bottomNavigationBar:  BottomNavigationBar(
         currentIndex: controller.tabIndex,
         onTap: controller.changeTabIndex,
         selectedItemColor: appcolor,
         unselectedItemColor: Colors.grey,

         items: [
            _bottombarItem(IconlyBold.home, "home"),
            _bottombarItem(IconlyBold.ticket, "trajet"),
         ],
       ),
     );
   });
  }
}
_bottombarItem(IconData icon,String lable){
  return BottomNavigationBarItem(icon: Icon(icon),label: lable);
}