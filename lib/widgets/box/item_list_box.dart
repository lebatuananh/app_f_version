import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';

class ItemUtilitiesMenu extends StatelessWidget {
  final Function press;
  final String title;
  final Color bgColor;
  final Widget widget;
  const ItemUtilitiesMenu({
    Key? key,
    required this.title,
    required this.press,
    required this.bgColor,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: bgFill,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 1))
          ],
        ),
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: bgColor,
              ),
              child: widget,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
      onTap: press(),
    );
  }

  // void _showDialogStruct(context) {
  //   print("SHow Tien Trinh Xu Ly");
  //   showDialog(
  //       context: context, builder: (BuildContext context) => DialogStructure());
  // }

  // void _showDialogListFile(context) {
  //   print("SHow File dinh kem");
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) => DialogAttachedDocument());
  // }
}
