import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class TextFieldChangePass extends StatelessWidget {
  final Widget child;
  const TextFieldChangePass({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: mFillColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kPrimaryColor)),
      child: child,
    );
  }
}
