import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class BackgroundForgetPass extends StatelessWidget {
  final Widget child;
  const BackgroundForgetPass({
    required Key key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: primaryLightBlue,
          ),
        ),
        child,
      ],
    ));
  }
}
