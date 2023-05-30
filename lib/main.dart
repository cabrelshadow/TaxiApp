import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/controller/auth_controller.dart';
import 'package:taxiapp/routes/routes.dart';
import 'package:taxiapp/views/create_trajets.dart';
import 'package:taxiapp/views/homeScreen.dart';
import 'package:taxiapp/views/login_screen.dart';
import 'package:taxiapp/views/navbar.dart';
import 'package:taxiapp/views/profile_settings.dart';
import 'package:taxiapp/views/show_trajet.dart';
import 'package:taxiapp/views/sierge.dart';
import 'package:taxiapp/views/splash_screen.dart';
import 'package:taxiapp/views/test.dart';
import 'package:taxiapp/views/trajet.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController =Get.put(AuthController());
    authController.decideRoute();
    final textTheme = Theme.of(context).textTheme;
    return  GetMaterialApp(initialRoute: AppPage.getnavbar(),
      getPages:AppPage.routes ,

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),

      home:Splashscreen(),


    );
  }
}
