import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class AppBarCustom extends StatelessWidget {
  final Function() press;
  final String title;
  // final Color bg;
  const AppBarCustom({
    required Key key,
    required this.press,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // color: bg,
      width: size.width,
      padding: EdgeInsets.all(20),
      height: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) {
              //     return SearchScreen();
              //   }),
              // );
            },
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: qGrey),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
