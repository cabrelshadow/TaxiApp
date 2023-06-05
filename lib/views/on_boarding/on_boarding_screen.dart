import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taxiapp/routes/verifie_user_login.dart';
import 'package:taxiapp/views/login_screen.dart';



import '../../constants/colors.dart';
import '../../constants/image_string.dart';
import '../../constants/text_strings.dart';
import '../../models/model_on_boarding.dart';
import 'on_boading_screen_widget.dart';
class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final pages=[
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnboardingImagePage2,
          title: tOnBoardingTitle1,
          subTitle: "pour tout vos voyages rapide,nous sommes la pour vous",
          counterText: tOnBoardingCounter1,
          height: size.height,
          bgColor: appcolor,

        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnboardingImagePage2,
          title: tOnBoardingTitle2,
          subTitle:"",
          counterText: tOnBoardingCounter2,
          height: size.height,
          bgColor: tOnBoardingPage2Color,

        ),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnboardingImagePage3,
          title: tOnBoardingTitle3,
          subTitle:"",
          counterText: tOnBoardingCounter3,
          height: size.height,
          bgColor: tOnBoardingPage3Color,

        ),
      ),
    ];

    return Scaffold(

      body: Stack(
      alignment: Alignment.center,

        children: [
          LiquidSwipe(
              pages:pages,
            liquidController: controller,
            onPageChangeCallback:onPageChangefCallback ,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,

          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: (){
                int nexPage= controller.currentPage+1;
                  controller.animateToPage(page: nexPage);
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black26),
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
                onPrimary: Colors.white,
              ), child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF272727),shape: BoxShape.circle,
              ),

                  child: Icon(Icons.arrow_forward_ios),
            ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: ()=> Get.to(UserAuthVerifie()),
              child: Text("Skip",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ),
          Positioned(
            bottom: 10,

          child: AnimatedSmoothIndicator(
             activeIndex: controller.currentPage,
            effect: WormEffect(
              activeDotColor: Color(0xff272727),
              dotHeight: 5.0
            ),
            count: 3,
          ),
          )
        ],
      ),
    );
  }

   onPageChangefCallback(int activePageIndex) {
    setState(() {
      currentPage=activePageIndex;
    });


  }
}


