import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCategory extends StatelessWidget {
  final String text;
  final String urlImg;
  final Function() press;
  const ButtonCategory({
    Key? key,
    required this.urlImg,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(1),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          onPrimary: Colors.red,
        ),
        onPressed: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(urlImg),
              height: 40,
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
