import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class TextFieldUnable extends StatelessWidget {
  final Widget child;
  const TextFieldUnable({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
