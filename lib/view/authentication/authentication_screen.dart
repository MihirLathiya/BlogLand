import 'package:blog_land/controller/tab_controller.dart';
import 'package:blog_land/view/authentication/log_in.dart';
import 'package:blog_land/view/authentication/sign_up.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  TabControllers tabControllers = Get.put(TabControllers());
  @override
  void initState() {
    tabController =
        TabController(length: tabControllers.tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 85 * size),
            SvgPicture.asset(
              AppImage.logo,
              height: 56 * size,
              width: 113 * size,
            ),
            SizedBox(height: 32 * size),
            Expanded(
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColor.mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28 * size),
                    topRight: Radius.circular(28 * size),
                  ),
                ),
                child: GetBuilder<TabControllers>(
                  builder: (controller) {
                    return Column(
                      children: [
                        SizedBox(height: 24 * size),
                        TabBar(
                          controller: tabController,
                          indicatorColor: AppColor.transparent,
                          onTap: (value) {
                            controller.updateTab(value);
                          },
                          tabs: [
                            ...List.generate(
                              controller.tabs.length,
                              (index) => CommonText(
                                text: controller.tabs[index],
                                color: controller.selectTab == index
                                    ? AppColor.whiteColor
                                    : Color.fromRGBO(255, 255, 255, 0.25),
                                weight: FontWeight.w800,
                                size: 18 * size,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 22 * size),
                        Expanded(
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28 * size),
                                topRight: Radius.circular(28 * size),
                              ),
                            ),
                            child: TabBarView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: tabController,
                              children: [
                                LogInView(size: size, font: font),
                                SignUpView(size: size, font: font),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget socialAuth(
    {double? size,
    googleOnTap,
    facebookOnTap,
    twitterOnTap,
    String? googlePath,
    String? facebookPath,
    String? twitterPath}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: googleOnTap,
        child: SvgPicture.asset(
          googlePath!,
          height: 36 * size!,
          width: 36 * size,
        ),
      ),
      GestureDetector(
        onTap: facebookOnTap,
        child: SvgPicture.asset(
          facebookPath!,
          height: 36 * size,
          width: 36 * size,
        ),
      ),
      GestureDetector(
        onTap: twitterOnTap,
        child: SvgPicture.asset(
          twitterPath!,
          height: 36 * size,
          width: 36 * size,
        ),
      ),
    ],
  );
}
