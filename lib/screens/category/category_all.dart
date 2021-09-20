import 'package:flutter/material.dart';
import 'package:futech_app/screens/category/category_card.dart';
import 'package:futech_app/screens/home_screen.dart';
import 'package:futech_app/screens/notifications/notification_screen.dart';
import 'package:futech_app/widgets/appbar/logo_animation_inside.dart';
import 'package:futech_app/widgets/text/text.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';
import 'package:futech_app/widgets/utils/sizeconfig.dart';
import 'package:futech_app/widgets/utils/spacing.dart';

class CategoryAllScreen extends StatefulWidget {
  const CategoryAllScreen({Key? key}) : super(key: key);

  @override
  _CategoryAllScreenState createState() => _CategoryAllScreenState();
}

class _CategoryAllScreenState extends State<CategoryAllScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerJ;
  @override
  void initState() {
    // TODO: implement initState
    _controllerJ = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
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
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Icon(
            Icons.chevron_left,
            color: AppTheme.theme.colorScheme.onBackground,
          ),
        ),
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
                    color:
                        AppTheme.theme.colorScheme.onBackground.withAlpha(200),
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
                          borderRadius: BorderRadius.all(Radius.circular(40))),
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
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Container(
        padding: FxSpacing.top(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Categories
              Padding(
                padding: FxSpacing.horizontal(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.sh1("Danh mục",
                        letterSpacing: 0,
                        color: AppTheme.theme.colorScheme.onBackground,
                        fontWeight: 600),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(1, 10, 1, 0),
                child: GridView.count(
                  physics: ClampingScrollPhysics(),
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  childAspectRatio: 1.1,
                  children: [
                    CategoryCard(
                      title: "Trò chuyện",
                      img: "chat.png",
                      press: () {
                        print("Pressed");
                      },
                      flagBorder: true,
                    ),
                    CategoryCard(
                      title: "Danh sách khám bệnh hàng ngày",
                      img: "healthcare.png",
                      press: () {
                        print("Pressed");
                      },
                      flagBorder: true,
                    ),
                    CategoryCard(
                      title: "Danh sách đơn thuốc",
                      img: "prescription.png",
                      press: () {
                        print("Pressed");
                      },
                      flagBorder: true,
                    ),
                    CategoryCard(
                      title: "Danh sách F0\nchờ bác sĩ",
                      img: "group-users.png",
                      press: () {
                        print("Pressed");
                      },
                      flagBorder: true,
                    ),
                    CategoryCard(
                      title: "Danh sách các yêu cầu",
                      img: "exchange.png",
                      press: () {
                        print("Pressed");
                      },
                      flagBorder: true,
                    ),
                    CategoryCard(
                      title: "Tạo thông tin\nngười dùng",
                      img: "profile.png",
                      press: () {
                        print("Pressed");
                      },
                      flagBorder: true,
                    ),
                    CategoryCard(
                      title: "Tạo đơn thuốc",
                      img: "clipboard.png",
                      press: () {
                        print("Pressed");
                      },
                      flagBorder: true,
                    ),
                    CategoryCard(
                      title: "Tạo yêu cầu",
                      img: "customer-support.png",
                      press: () {
                        print("Pressed");
                      },
                      flagBorder: true,
                    ),
                  ],
                ),
              ),
              FxSpacing.height(8),
            ],
          ),
        ),
      ),
    );
  }
}
