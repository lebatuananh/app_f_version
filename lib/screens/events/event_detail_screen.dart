import 'package:flutter/material.dart';
import 'package:futech_app/models/detail_event.dart';
import 'package:futech_app/screens/events/event_screen.dart';
import 'package:futech_app/styles/shadow.dart';
import 'package:futech_app/styles/styles.dart';
import 'package:futech_app/widgets/appbar/logo_animation_inside.dart';
import 'package:futech_app/widgets/card/card.dart';
import 'package:futech_app/widgets/container.dart';
import 'package:futech_app/widgets/text/text.dart';
import 'package:futech_app/widgets/theme/app_theme.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';
import 'package:futech_app/widgets/utils/sizeconfig.dart';
import 'package:futech_app/widgets/utils/spacing.dart';
import 'package:futech_app/widgets/utils/text_utils.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen>
    with TickerProviderStateMixin {
  late FullEvent eventDetail;
  late AnimationController _controllerJ;

  @override
  void initState() {
    _controllerJ = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat();
    super.initState();

    eventDetail = FullEvent.getSingle();
  }

  @override
  void dispose() {
    _controllerJ.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: FxAppTheme.customTheme.bgLayer1,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              child: LogoRoundAnimationInside(controllerJ: _controllerJ),
            ),
            Spacing.width(10),
            Text(
              "Futech",
              style: TextStyle(color: primaryBlue),
            )
          ],
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            color: AppTheme.theme.colorScheme.onBackground,
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.event_note_outlined,
          //     color: primaryBlue,
          //   ),
          //   onPressed: () {
          //     // Navigator.push(context,
          //     //     MaterialPageRoute(builder: (context) => EventScreen()));
          //     Navigator.of(context, rootNavigator: false).push(
          //         MaterialPageRoute(
          //             builder: (context) => EventScreen(),
          //             maintainState: false));
          //   },
          // ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: darkGrey, //star if chose favorite
            ),
            onPressed: () {},
          ),
          FxSpacing.width(16)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppTheme.customTheme.groceryPrimary,
        label: FxText.b2("Watch Video",
            color: AppTheme.customTheme.groceryOnPrimary, fontWeight: 600),
        icon: Icon(
          Icons.play_circle_fill,
          color: AppTheme.customTheme.groceryOnPrimary,
        ),
      ),
      body: Container(
        color: FxAppTheme.theme.scaffoldBackgroundColor,
        child: ListView(
          padding: FxSpacing.fromLTRB(24, 4, 24, 0),
          children: [
            FxText.h5(eventDetail.title, fontWeight: 800, letterSpacing: -0.2),
            FxSpacing.height(8),
            FxText.b2(eventDetail.body,
                color: AppTheme.theme.colorScheme.onBackground.withAlpha(140),
                letterSpacing: 0,
                fontWeight: 600),
            FxSpacing.height(24),
            Row(
              children: [
                Column(
                  children: [
                    FxText.h6("Nutritions",
                        fontWeight: 700, letterSpacing: -0.2),
                    FxSpacing.height(16),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: buildNutritionList()),
                  ],
                ),
                FxSpacing.width(24),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image(
                      image: AssetImage(eventDetail.image),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            FxSpacing.height(24),
            FxText.h6("Ingredients", fontWeight: 700, letterSpacing: -0.2),
            FxSpacing.height(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildIngredientList(),
            ),
            FxSpacing.height(24),
            FxText.h6("Preparation", fontWeight: 700, letterSpacing: -0.2),
            FxSpacing.height(16),
            FxText.b2(eventDetail.preparation,
                fontWeight: 500, letterSpacing: 0, muted: true),
            FxSpacing.height(80)
          ],
        ),
      ),
    );
  }

  List<Widget> buildNutritionList() {
    List<Widget> list = [];
    for (int i = 0; i < eventDetail.nutritions.length; i++) {
      list.add(singleNutrition(eventDetail.nutritions[i]));
      if (i + 1 < eventDetail.nutritions.length) list.add(FxSpacing.height(16));
    }
    return list;
  }

  Widget singleNutrition(Nutrition nutrition) {
    return FxCard(
      borderRadiusAll: 50,
      padding: FxSpacing.fromLTRB(8, 8, 12, 8),
      color: AppTheme.customTheme.cookifyPrimary.withAlpha(40),
      shadow: FxShadow(elevation: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FxContainer.bordered(
              paddingAll: 4,
              width: 32,
              height: 32,
              borderRadiusAll: 16,
              color: AppTheme.customTheme.cookifyPrimary.withAlpha(200),
              border: Border.all(
                  color: AppTheme.customTheme.cookifyPrimary, width: 1),
              child: Center(
                  child: FxText.caption(
                      FxTextUtils.doubleToString(
                        nutrition.unit,
                      ),
                      letterSpacing: 0,
                      color: AppTheme.customTheme.cookifyOnPrimary))),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxText.button(nutrition.name, fontWeight: 600),
              FxText.overline(nutrition.unitType,
                  xMuted: true, fontWeight: 600),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> buildIngredientList() {
    List<Widget> list = [];
    for (Ingredient ingredient in eventDetail.ingredients) {
      list.add(FxText.button(ingredient.ingredient,
          muted: true, height: 1.7, letterSpacing: 0));
    }
    return list;
  }
}
