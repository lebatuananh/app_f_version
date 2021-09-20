import 'package:flutter/material.dart';
import 'package:futech_app/screens/auth/menu_screen.dart';
import 'package:futech_app/screens/auth/profile_screen.dart';
import 'package:futech_app/screens/home_page_screen.dart';
import 'package:futech_app/screens/events/event_screen.dart';
import 'package:futech_app/screens/notifications/notification_screen.dart';
import 'package:futech_app/screens/scan/scan_screen.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:futech_app/widgets/appbar/logo_animation_inside.dart';
import 'package:futech_app/widgets/navigationbottom/custom_animated_bottom_bar.dart';
import 'package:futech_app/widgets/text/text.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';
import 'package:futech_app/widgets/utils/sizeconfig.dart';

class HomeScreen extends StatefulWidget {
  final Map? data;
  const HomeScreen({Key? key, this.data}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late PageController _pageController;
  final _inactiveColor = Colors.grey;
  late AnimationController _controllerJ;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controllerJ = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controllerJ.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                child: LogoRoundAnimationInside(controllerJ: _controllerJ),
              ),
              Spacing.width(10),
              Image.asset(
                "assets/brands/character_futech_grey.png",
                width: 100,
              )
            ],
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Transform.scale(
              scale: 1.3,
              child: IconButton(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Icon(
                      Icons.notifications_none,
                      size: 22,
                      color: AppTheme.theme.colorScheme.onBackground
                          .withAlpha(200),
                    ),
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: Spacing.zero,
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                            color: AppTheme.customTheme.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: Center(
                          child: FxText.overline(
                            "2",
                            color: AppTheme.customTheme.groceryOnPrimary,
                            fontSize: 9,
                            fontWeight: 500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return NotificationScreen();
                      },
                      fullscreenDialog: true));
                },
              ),
            ),
            Transform.scale(
              scale: 1.3,
              child: IconButton(
                icon: Container(
                  padding: EdgeInsets.all(5),
                  width: 38,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return ProfileScreen();
                      },
                      fullscreenDialog: true));
                },
              ),
            )
          ],
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              CategoryScreen(),
              EventScreen(),
              QrCodeScreen(),
              MenuScreen(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar());
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) {
        setState(() {
          _currentIndex = index;
          // print(index);
        });
        _pageController.jumpToPage(index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Trang chủ'),
          activeColor: primaryBlue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.event),
          title: Text('Sự kiện'),
          activeColor: primaryBlue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.qr_code_scanner_rounded),
          title: Text(
            'Quét mã QR',
          ),
          activeColor: primaryBlue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Thiết lập'),
          activeColor: primaryBlue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
