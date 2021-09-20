import 'dart:math';

import 'package:flutter/material.dart';

class LogoRoundAnimationInside extends StatelessWidget {
  const LogoRoundAnimationInside({
    Key? key,
    required AnimationController controllerJ,
  })  : _controllerJ = controllerJ,
        super(key: key);

  final AnimationController _controllerJ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _controllerJ.view,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controllerJ.value * 2 * pi,
              child: child,
            );
          },
          child: Container(
            child: Image(
              image: AssetImage("assets/brands/circle-external.png"),
              height: 50,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controllerJ.view,
          builder: (context, child) {
            return Transform.rotate(
              angle: (-1) * _controllerJ.value * 2 * pi,
              child: child,
            );
          },
          child: Container(
            child: Image(
              image: AssetImage("assets/brands/circle-internal.png"),
              height: 35,
            ),
          ),
        ),
        Image(
          image: AssetImage("assets/brands/f.png"),
          height: 18,
        ),
      ],
    );
  }
}
