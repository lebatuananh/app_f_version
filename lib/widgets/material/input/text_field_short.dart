import 'package:flutter/material.dart';

class TextFieldContainerShort extends StatelessWidget {
  final Widget child;
  const TextFieldContainerShort({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.grey),
          )),
      child: child,
    );
  }
}
