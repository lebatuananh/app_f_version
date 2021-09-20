import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class BackgroundPrimary extends StatelessWidget {
  final Widget child;

  const BackgroundPrimary({
    required Key key,
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
              decoration: BoxDecoration(
                color: primaryLightBlue,
              ),
            ),
            child,
          ],
        ));
  }
}
