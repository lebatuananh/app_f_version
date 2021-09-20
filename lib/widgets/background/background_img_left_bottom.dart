import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class BackgroundImgLeftBottom extends StatelessWidget {
  final Widget child;

  const BackgroundImgLeftBottom({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: primaryLightBlue,
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height,
              width: double.infinity,
              color: Colors.white,
            ),
            Positioned(
              child: Image.asset(
                'assets/images/circle.png',
              ),
              top: 0,
              left: 0,
              width: 150,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/images/img-bg.png',
                width: 250,
              ),
            ),
            child,
          ],
        ));
  }
}
