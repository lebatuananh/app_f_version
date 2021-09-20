import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Widget widget;
  final double width;
  final double margin;
  const ButtonText(
      {Key? key,
      required this.text,
      required this.widget,
      required this.width,
      required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return widget;
            }),
          );
        },
        child: new Text(
          text,
          style: TextStyle(
              fontSize: 16.0, color: primaryBlue, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
