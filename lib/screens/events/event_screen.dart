import 'package:flutter/material.dart';
import 'package:futech_app/screens/notifications/notification_screen.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:futech_app/widgets/appbar/logo_animation_inside.dart';
import 'package:futech_app/widgets/text/text.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';
import 'package:futech_app/widgets/utils/sizeconfig.dart';
import 'package:futech_app/widgets/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late ThemeData themeData;
  int selectedDate = 2;

  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: AppTheme.customTheme.bgLayer1,
        child: ListView(
          padding: Spacing.top(10),
          children: [
            Container(
              margin: Spacing.fromLTRB(24, 0, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.h7("Today!",
                          color: AppTheme.theme.colorScheme.onBackground),
                      FxText.h6("13 Wed",
                          color: AppTheme.theme.colorScheme.onBackground),
                    ],
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        MdiIcons.calendarOutline,
                        size: MySize.size22,
                        color: primaryBlue,
                      ),
                      onPressed: () {
                        print("Click here");
                      },
                    ),
                  )
                ],
              ),
            ),
            //Schedule
            Container(
              margin: Spacing.top(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  singleDateWidget(date: "11\nMon", index: 0),
                  singleDateWidget(date: "12\nTue", index: 1),
                  singleDateWidget(date: "13\nWed", index: 2),
                  singleDateWidget(date: "14\nThu", index: 3),
                  singleDateWidget(date: "15\nFri", index: 4),
                  singleDateWidget(date: "16\nSat", index: 5),
                ],
              ),
            ),
            //Activity
            Container(
              margin: Spacing.fromLTRB(24, 24, 24, 0),
              child: FxText.sh1("Các hoạt động",
                  letterSpacing: 0,
                  color: AppTheme.theme.colorScheme.onBackground,
                  fontWeight: 600),
            ),
            Container(
                margin: Spacing.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: [
                    singleActivityWidget(
                        color: Colors.blue,
                        iconData: MdiIcons.clock,
                        time: "06:00 AM",
                        title: "Vitamin C",
                        description: "Lần 1 viên"),
                    FxSpacing.height(8),
                    singleActivityWidget(
                        color: Colors.blue,
                        iconData: MdiIcons.clock,
                        time: "09:00 AM",
                        title: "Có hẹn bác sĩ",
                        description: "Thăm khám bác sĩ"),
                    FxSpacing.height(8),
                    singleActivityWidget(
                        color: Colors.blue,
                        iconData: MdiIcons.clock,
                        time: "12:00 PM",
                        title: "Tylenol",
                        description: "Lần 2 viên"),
                    FxSpacing.height(8),
                    singleActivityWidget(
                        color: Colors.blue,
                        iconData: MdiIcons.clock,
                        time: "06:00 PM",
                        title: "Tylenol",
                        description: "Lần 2 viên"),
                    FxSpacing.height(8),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget singleDateWidget({required String date, required int index}) {
    if (selectedDate == index) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedDate = index;
          });
        },
        child: Container(
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: themeData.colorScheme.primary,
          ),
          padding: Spacing.fromLTRB(0, 8, 0, 14),
          child: Column(
            children: [
              Text(
                date,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    fontWeight: 600,
                    color: themeData.colorScheme.onBackground,
                    height: 1.9),
                textAlign: TextAlign.center,
              ),
              Container(
                margin: Spacing.top(12),
                height: 8, //MySize.size8,
                width: 8, //MySize.size8,
                decoration: BoxDecoration(
                    color: themeData.colorScheme.onBackground,
                    shape: BoxShape.circle),
              )
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          selectedDate = index;
        });
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(8.0)), //MySize.size6!
            color: AppTheme.customTheme.bgLayer1,
            boxShadow: [
              BoxShadow(
                color: AppTheme.customTheme.shadowColor,
                blurRadius: 10, //double.parse(MySize.size10.toString()),
                spreadRadius: 2, //MySize.size2,
                offset: Offset(0, 8), //MySize.size8!
              )
            ]),
        padding: Spacing.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            Text(
              date,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 600,
                  // color: themeData.colorScheme.onBackground,
                  height: 1.9),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget singleActivityWidget(
      {required String time,
      required Color color,
      required IconData iconData,
      required String title,
      required String description}) {
    return Container(
      child: Row(
        children: [
          Container(
              width: 72, //MySize.size72,
              child: Text(
                time,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.caption,
                  muted: true,
                  letterSpacing: 0,
                ),
              )),
          Expanded(
            child: Container(
              padding: Spacing.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: AppTheme.customTheme.bgLayer1,
                  boxShadow: [
                    BoxShadow(
                        color: AppTheme.customTheme.shadowColor,
                        blurRadius: 8.0, //MySize.size8!,
                        offset: Offset(0, 8.0)) //MySize.size8!
                  ]),
              child: Row(
                children: [
                  Container(
                      padding: Spacing.all(8),
                      decoration: BoxDecoration(
                          color: color.withAlpha(24),
                          borderRadius: BorderRadius.all(Radius.circular(4.0))),
                      child: Icon(
                        iconData,
                        color: color,
                        size: MySize.size30,
                      )),
                  Container(
                    margin: Spacing.left(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              // color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        Text(
                          description,
                          style:
                              AppTheme.getTextStyle(themeData.textTheme.caption,
                                  fontSize: 12,
                                  // color: themeData.colorScheme.onBackground,
                                  fontWeight: 500,
                                  muted: true),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
