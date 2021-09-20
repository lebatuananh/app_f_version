import 'package:futech_app/screens/category/category_all.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:futech_app/models/category_clinic.dart';
import 'package:futech_app/models/event.dart';
import 'package:futech_app/screens/category/category_card.dart';
import 'package:futech_app/screens/events/event_detail_screen.dart';
import 'package:futech_app/screens/special_clinics/doctor_list_page.dart';
import 'package:futech_app/widgets/container.dart';
import 'package:futech_app/widgets/text/text.dart';
import 'package:futech_app/widgets/theme/app_theme.dart';
import 'package:futech_app/widgets/theme/app_theme_overview.dart';
import 'package:futech_app/widgets/utils/SizeConfig.dart';
import 'package:futech_app/widgets/utils/generator.dart';
import 'package:futech_app/widgets/utils/spacing.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int selectedCategory = 0;
  List<CategoryClinic> categoryListItems = [];
  late List<Event> _eventLists;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryListItems = categoryList();
    _eventLists = getEventList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: FxSpacing.top(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: FxSpacing.x(16),
              child: FxText.h6("Xin chào, Jason Ngo!",
                  color: AppTheme.theme.colorScheme.onBackground),
            ),
            FxSpacing.height(16),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryAllScreen()));
                    },
                    child: FxText.caption("Tất cả",
                        color: AppTheme.theme.colorScheme.onBackground,
                        fontWeight: 600,
                        xMuted: true,
                        letterSpacing: 0),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1, 10, 1, 0),
              child: GridView.count(
                physics: ClampingScrollPhysics(),
                crossAxisCount: 4,
                shrinkWrap: true,
                childAspectRatio: 1.1,
                children: [
                  CategoryCard(
                    title: "Trò chuyện",
                    img: "chat.png",
                    press: () {
                      print("Pressed");
                    },
                    flagBorder: false,
                  ),
                  CategoryCard(
                    title: "Danh sách khám bệnh hàng ngày",
                    img: "healthcare.png",
                    press: () {
                      print("Pressed");
                    },
                    flagBorder: false,
                  ),
                  CategoryCard(
                    title: "Danh sách đơn thuốc",
                    img: "prescription.png",
                    press: () {
                      print("Pressed");
                    },
                    flagBorder: false,
                  ),
                  CategoryCard(
                    title: "Danh sách F0\nchờ bác sĩ",
                    img: "group-users.png",
                    press: () {
                      print("Pressed");
                    },
                    flagBorder: false,
                  ),
                  CategoryCard(
                    title: "Danh sách các yêu cầu",
                    img: "exchange.png",
                    press: () {
                      print("Pressed");
                    },
                    flagBorder: false,
                  ),
                  CategoryCard(
                    title: "Tạo thông tin\nngười dùng",
                    img: "profile.png",
                    press: () {
                      print("Pressed");
                    },
                    flagBorder: false,
                  ),
                  CategoryCard(
                    title: "Tạo đơn thuốc",
                    img: "clipboard.png",
                    press: () {
                      print("Pressed");
                    },
                    flagBorder: false,
                  ),
                  CategoryCard(
                    title: "Tạo yêu cầu",
                    img: "customer-support.png",
                    press: () {
                      print("Pressed");
                    },
                    flagBorder: false,
                  ),
                ],
              ),
            ),
            FxSpacing.height(8),
            //Specialist Clinic
            Padding(
              padding: FxSpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.sh1("Danh sách bác sĩ chuyên khoa",
                      letterSpacing: 0,
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600),
                  FxText.caption("Tất cả",
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true,
                      letterSpacing: 0),
                ],
              ),
            ),
            FxSpacing.height(16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: buildCategorieSpecialClinic(),
              ),
            ),
            FxSpacing.height(24),
            //Hot news
            Padding(
              padding: FxSpacing.horizontal(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.sh1("Thông tin cần thiết",
                      letterSpacing: 0,
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600),
                  FxText.caption("Tất cả",
                      color: AppTheme.theme.colorScheme.onBackground,
                      fontWeight: 600,
                      xMuted: true,
                      letterSpacing: 0),
                ],
              ),
            ),
            FxSpacing.height(16),
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: eventList(),
              ),
            ),
            FxSpacing.height(16),
          ],
        ),
      ),
    );
  }

  ///Specialist Clinic
  ///
  List<CategoryClinic> categoryList() {
    List<CategoryClinic> list = [];
    list.add(CategoryClinic(
        'assets/icons/broccoli.png',
        'Tim mạch', //Cardiologist
        FxAppTheme.customTheme.green.withAlpha(50)));
    list.add(CategoryClinic(
        'assets/icons/broccoli.png',
        'Nhãn khoa', //Ophthalmologist
        FxAppTheme.customTheme.green.withAlpha(50)));
    list.add(CategoryClinic(
        'assets/icons/broccoli.png',
        'Răng hàm mặt', //ENT
        FxAppTheme.customTheme.green.withAlpha(50)));
    list.add(CategoryClinic(
        'assets/icons/broccoli.png',
        'Nhi khoa', //Paediatrician
        FxAppTheme.customTheme.green.withAlpha(50)));
    list.add(CategoryClinic(
        'assets/icons/broccoli.png',
        'Phụ khoa', //Gynaecologist
        FxAppTheme.customTheme.green.withAlpha(50)));

    return list;
  }

  List<Widget> buildCategorieSpecialClinic() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));
    for (int i = 0; i < categoryListItems.length; i++) {
      list.add(getSingleCategory(categoryListItems[i]));
      list.add(FxSpacing.width(16));
    }
    return list;
  }

  Widget getSingleCategory(CategoryClinic category) {
    String heroTag = Generator.getRandomString(10);

    return Hero(
      tag: heroTag,
      child: FxContainer(
        width: 80,
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) =>
                      DoctorListPage(context, category, heroTag)));
        },
        padding: Spacing.all(6),
        color: category.color,
        child: Column(
          children: [
            Image.asset(
              category.image,
              width: 28,
              height: 28,
            ),
            FxSpacing.height(4),
            FxText.overline(
              category.title,
              color: AppTheme.theme.colorScheme.onBackground,
            )
          ],
        ),
      ),
    );
  }

  static List<Event> getEventList() {
    return [
      Event("Thực phẩm dành cho người béo phì", "Dinh dưỡng",
          "./assets/temps/recipe-2.jpg", DateTime.now(), 15, true),
      Event("Thực phẩm tăng cường đề kháng", "Dinh dưỡng",
          "./assets/temps/recipe-3.jpg", DateTime.now(), 17, false),
      Event("Món ăn ngày giãn cách", "Tin tức", "./assets/temps/recipe-4.jpg",
          DateTime.now(), 19, true),
    ];
  }

  List<Widget> eventList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(16));

    for (int i = 0; i < _eventLists.length; i++) {
      list.add(singleEvent(_eventLists[i]));
      list.add(FxSpacing.width(16));
    }

    return list;
  }

  Widget singleEvent(Event _event) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventDetailScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Image(
              image: AssetImage(_event.image),
              width: 240,
            ),
            Positioned(
                left: 16,
                top: 16,
                child: FxContainer(
                  paddingAll: 8,
                  color: Colors.black.withAlpha(200),
                  child: FxText.button(_event.parent,
                      color: AppTheme.customTheme.cookifyOnPrimary,
                      fontWeight: 600),
                )),
            Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: FxContainer(
                  padding: FxSpacing.xy(12, 16),
                  color: Color.lerp(AppTheme.customTheme.cookifyPrimary,
                          Colors.black, 0.9)!
                      .withAlpha(160),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FxText.sh1(_event.title,
                                color: Colors.white, fontWeight: 800),
                          ),
                          Icon(
                            _event.favorite
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: AppTheme.customTheme.cookifyPrimary,
                            size: 18,
                          )
                        ],
                      ),
                      FxSpacing.height(16),
                      FxText.overline(
                          DateFormat("dd/MM/yyyy HH:mm")
                                  .format(_event.created_date) +
                              " | " +
                              _event.view_count.toString() +
                              " lượt xem",
                          color: Colors.white,
                          fontWeight: 600),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
