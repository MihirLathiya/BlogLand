import 'package:blog_land/controller/bottom_bar_controller.dart';
import 'package:blog_land/view/home_screen/home_screen.dart';
import 'package:blog_land/view/profile_screen/profile_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  BottomBarController barController = Get.put(BottomBarController());
  List<String> icons = [
    AppImage.home,
    AppImage.articles,
    AppImage.search,
    AppImage.menu,
  ];
  List pages = [
    HomeScreen(),
    Container(
      color: Colors.grey,
    ),
    Container(
      color: Colors.green,
    ),
    ProfileScreen(),
    Container(
      color: Colors.blue,
    ),
  ];
  List<String> name = [
    'Home',
    'Article',
    'Search',
    'Menu',
  ];
  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return GetBuilder<BottomBarController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColor.mainColor,
            onPressed: () {
              controller.updateMenu(4);
            },
            child: SvgPicture.asset(
              AppImage.plus,
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 36 * size),
            height: 82 * size,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  icons.length,
                  (index) => GestureDetector(
                    onTap: () {
                      controller.updateMenu(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.selectMenu == index
                            ? SvgPicture.asset(
                                icons[index],
                                color: AppColor.mainColor,
                              )
                            : SvgPicture.asset(
                                icons[index],
                              ),
                        SizedBox(height: 6 * size),
                        CommonText(
                          text: name[index],
                          color: controller.selectMenu == index
                              ? AppColor.mainColor
                              : Color(0xff7B8BB2),
                          size: 10 * font,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          body: pages[controller.selectMenu],
        );
      },
    );
  }
}
