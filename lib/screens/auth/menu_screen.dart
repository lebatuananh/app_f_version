import 'package:flutter/material.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:futech_app/widgets/box/box_category.dart';
import 'package:futech_app/widgets/text/text.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';
import 'package:futech_app/widgets/utils/sizeconfig.dart';
import 'package:futech_app/widgets/utils/spacing.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        color: AppTheme.customTheme.bgLayer4,
        child: ListView(
          padding: Spacing.top(10),
          children: [
            Container(
              margin: Spacing.fromLTRB(24, 0, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.h6("Thiết lập",
                      color: AppTheme.theme.colorScheme.onBackground),
                ],
              ),
            ),
            FxSpacing.height(10),
            BoxCategoryGrid(),
            FxSpacing.height(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                            child: Icon(
                          Icons.person,
                          color: primaryBlue,
                        )),
                        contentPadding: EdgeInsets.only(right: 20, left: 20),
                        title: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Thông tin',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      Divider(),
                      ListTile(
                        leading: Container(
                            child: Icon(
                          Icons.person,
                          color: primaryBlue,
                        )),
                        contentPadding: EdgeInsets.only(right: 20, left: 20),
                        title: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Thay đổi mật khẩu',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      Divider(),
                      ListTile(
                        leading: Container(
                            child: Icon(
                          Icons.person,
                          color: primaryBlue,
                        )),
                        contentPadding: EdgeInsets.only(right: 20, left: 20),
                        title: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trợ giúp',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      FxSpacing.height(10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: qGrey,
                            boxShadow: [
                              BoxShadow(
                                  color: bgFill,
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 1))
                            ]),
                        child: ListTile(
                          title: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ĐĂNG XUẤT',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: primaryBlue),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.logout,
                                  color: primaryBlue,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
