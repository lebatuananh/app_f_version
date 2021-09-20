import 'package:flutter/material.dart';
import 'package:futech_app/screens/auth/login_screen.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:futech_app/widgets/container.dart';
import 'package:futech_app/widgets/text/text.dart';
import 'package:futech_app/widgets/theme/app_theme.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';
import 'package:futech_app/widgets/utils/sizeconfig.dart';
import 'package:futech_app/widgets/utils/spacing.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FxAppTheme.theme.copyWith(
          colorScheme: AppTheme.theme.colorScheme.copyWith(
              secondary: AppTheme.customTheme.groceryPrimary.withAlpha(80))),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: FxAppTheme.theme.scaffoldBackgroundColor,
          elevation: 0,
          actions: [
            Container(
              margin: Spacing.right(16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.close,
                  size: 24,
                  color: AppTheme.theme.colorScheme.onBackground,
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: Spacing.fromLTRB(24, 0, 24, 70),
          children: [
            Center(
              child: FxContainer.rounded(
                padding: Spacing.all(20),
                color: AppTheme.customTheme.groceryPrimary.withAlpha(40),
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            FxSpacing.height(16),
            Center(
              child: FxText.b1("Jason Ngo", fontWeight: 600),
            ),
            FxSpacing.height(8),
            Center(
              child: FxText.b1(
                "Không chia sẻ mã QR này với bất kỳ ai để đảm bảo an toàn cho bạn!",
                fontWeight: 600,
                textAlign: TextAlign.center,
              ),
            ),
            FxSpacing.height(16),
            Center(
              child: QrImage(
                foregroundColor: primaryBlue,
                data: 'This QR code has an embedded image as well',
                version: QrVersions.auto,
                size: 280,
                gapless: false,
                embeddedImage: AssetImage('assets/brands/logo-white-bg.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(60, 60),
                ),
                // eyeStyle:
                //     QrEyeStyle(eyeShape: QrEyeShape.circle, color: primaryBlue),
              ),
            ),
            FxSpacing.height(16),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: getSingleSetting(
                  iconData: MdiIcons.logout,
                  color: AppTheme.customTheme.green,
                  title: "Thông tin"),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: getSingleSetting(
                  iconData: MdiIcons.logout,
                  color: AppTheme.customTheme.red,
                  title: "Đăng xuất"),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSingleSetting(
      {IconData? iconData, required Color color, required String title}) {
    return Container(
      margin: Spacing.bottom(16),
      child: Row(
        children: [
          FxContainer(
            color: color.withAlpha(24),
            child: Icon(
              iconData,
              color: color,
              size: 22,
            ),
          ),
          FxSpacing.width(24),
          FxText.b1(title, letterSpacing: 0.3, fontWeight: 600)
        ],
      ),
    );
  }
}
