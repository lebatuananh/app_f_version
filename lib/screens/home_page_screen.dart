import 'package:flutter/material.dart';
import 'package:futech_app/screens/category/category_page.dart';
import 'package:futech_app/screens/notifications/notification_screen.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:futech_app/widgets/appbar/logo_animation_inside.dart';
import 'package:futech_app/widgets/text/text.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';
import 'package:futech_app/widgets/utils/sizeconfig.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CategoryPage(),
      ),
    );
  }
}
