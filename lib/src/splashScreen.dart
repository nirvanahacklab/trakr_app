import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble_example/main.dart';
import 'package:flutter_reactive_ble_example/src/constants/constant_colors.dart';
import 'package:flutter_reactive_ble_example/src/ui/signIn.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedSplashScreen(splash: Image.asset("assets/AppLogo.png", scale: 0.4,),
        backgroundColor: background,
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        //splashIconSize: 900,
        nextScreen: SignIn());
}

