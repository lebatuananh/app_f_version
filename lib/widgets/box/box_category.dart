import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:futech_app/widgets/box/item_list_box.dart';

class BoxCategoryGrid extends StatefulWidget {
  const BoxCategoryGrid({Key? key}) : super(key: key);

  @override
  _BoxCategoryState createState() => _BoxCategoryState();
}

class _BoxCategoryState extends State<BoxCategoryGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ItemUtilitiesMenu(
            press: () {
              print('This is the submission screen');
            },
            title: "Trình ký",
            widget: Icon(
              Icons.assignment,
              color: primaryBlue,
            ),
            bgColor: primaryLightBlue,
          ),
          ItemUtilitiesMenu(
            press: () {
              print('This is the submission screen');
            },
            title: "Chính sách riêng tư",
            widget: Icon(
              Icons.policy,
              color: Color(0xFFC56719),
            ),
            bgColor: primaryLightBlue,
          ),
          ItemUtilitiesMenu(
            press: () {
              print('This is the submission screen');
            },
            title: "Submissions",
            widget: Icon(
              Icons.assignment,
              color: primaryBlue,
            ),
            bgColor: primaryLightBlue,
          ),
          ItemUtilitiesMenu(
            press: () {
              print('This is the submission screen');
            },
            title: "Submissions",
            widget: Icon(
              Icons.assignment,
              color: primaryBlue,
            ),
            bgColor: primaryLightBlue,
          ),
        ],
      ),
    );
  }

  void onRequest() async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => SubmissionMain()));
    print('This is the submission screen');
  }
}
