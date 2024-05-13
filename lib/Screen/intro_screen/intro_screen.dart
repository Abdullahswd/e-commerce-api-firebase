import 'package:e_commerce_api/Screen/auth/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../model/introductionScreen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        pages: slides,
        done: const Text('Next' , style: TextStyle(fontSize: 20),),
        onDone: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
        },
        showNextButton: false,
        showSkipButton: true,
        skip: const Text('Skip' , style: TextStyle(fontSize: 20),),
        onSkip: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));

        },

    );
  }
}