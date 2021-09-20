import 'package:flutter/material.dart';
import 'package:futech_app/models/category_clinic.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';

class DoctorListPage extends StatefulWidget {
  final BuildContext rootContext;
  final CategoryClinic category;
  final String heroTag;

  const DoctorListPage(this.rootContext, this.category, this.heroTag);

  @override
  _DoctorListPageState createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.customTheme.groceryBg1,
      appBar: AppBar(
        backgroundColor: AppTheme.customTheme.groceryBg1,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppTheme.theme.colorScheme.onBackground,
          ),
        ),
      ),
      body: Container(
        child: Text("Doctor List"),
      ),
    );
  }
}
