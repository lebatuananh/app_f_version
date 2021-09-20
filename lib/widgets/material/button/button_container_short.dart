import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class ButtonContainerShort extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;
  const ButtonContainerShort({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width / 3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: kPrimaryColor,
          elevation: 3,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          shadowColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
