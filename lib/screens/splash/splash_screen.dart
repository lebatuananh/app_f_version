import 'dart:async';

import 'package:flutter/material.dart';
import 'package:futech_app/screens/splash/onboarding_screen.dart';
import 'package:futech_app/styles/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
  }

  initScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontSize: 50,
                            color: primaryBlue,
                            fontFamily: 'Righteous-Regular'),
                      ),
                      Text(
                        'to Futech !',
                        style: TextStyle(
                            fontSize: 50,
                            color: primaryBlue,
                            fontFamily: 'Righteous-Regular'),
                      ),
                    ],
                  ),
                  top: 220,
                  left: 50,
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/splash.png',
                  ),
                  bottom: 0,
                  right: 0,
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/circle.png',
                  ),
                  top: 0,
                  left: 0,
                ),
              ],
            ),
            // child: Image.asset('lib/assets/brands/logo-sm.png'),
          ),
        ),
      ),
    );
  }
}
