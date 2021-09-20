import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class CategoryCard extends StatelessWidget {
  final String? img;
  final String? title;
  final Function press;
  final bool flagBorder;
  const CategoryCard(
      {Key? key,
      this.img,
      this.title,
      required this.press,
      required this.flagBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(0.0),
      decoration:
          !flagBorder ? null : BoxDecoration(border: Border.all(width: 0.01)),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 35,
              width: 35,
              child: Image(
                image: AssetImage("assets/icons/${img.toString()}"),
                width: 20,
              ),
            ),
            Container(
                height: 30,
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  title.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: bodyText2,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ))
          ],
        ),
        onTap: press(),
      ),
    );
  }
}
