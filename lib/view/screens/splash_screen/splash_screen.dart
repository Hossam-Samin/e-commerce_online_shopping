import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../generated/l10n.dart';
import '../../constans/app_assets_images/app_assets_images.dart';
import '../onbarding_screens/onboarding_screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.iconSplashScreen,
            fit: BoxFit.cover,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              S.of(context).splash,
              style: const TextStyle(fontSize: 20, fontFamily: "Rubik"),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 7.0,
              animationDuration: 3000,
              percent: 1,
              barRadius: const Radius.circular(50),
              progressColor: Colors.green,
              onAnimationEnd: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnBoardingScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
