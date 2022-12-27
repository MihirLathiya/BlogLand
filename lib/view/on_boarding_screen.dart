import 'dart:developer';

import 'package:blog_land/controller/page_controller.dart';
import 'package:blog_land/view/authentication/authentication_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  PageControllers pageControllers = Get.put(PageControllers());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.whiteColor,
              AppColor.whiteColor,
              AppColor.whiteColor,
              AppColor.lightBlueColor,
              AppColor.lightBlueColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GetBuilder<PageControllers>(
          builder: (controller) {
            return Column(
              children: [
                SizedBox(height: 64 * size),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40 * size),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(() => AuthenticationScreen());
                      },
                      child: CommonText(
                        text: 'SKIP',
                        weight: FontWeight.w500,
                        color: AppColor.textColor,
                        size: 15 * font,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30 * size),
                SizedBox(
                  height: 332 * size,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      controller.updatePage(value);
                      log('VALUE :- ${controller.selectPage}');
                      log('VALUE :- ${value}');
                    },
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        height: 332 * size,
                        child: Column(
                          children: [
                            pageViewImage(
                              size: size,
                              flex1: 1,
                              flex2: 2,
                              image1: AppImage.image1,
                              image2: AppImage.image5,
                            ),
                            SizedBox(
                              height: 16 * size,
                            ),
                            pageViewImage(
                              size: size,
                              flex1: 2,
                              flex2: 1,
                              image1: AppImage.image3,
                              image2: AppImage.image4,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        height: 332 * size,
                        child: Column(
                          children: [
                            pageViewImage(
                              size: size,
                              flex1: 2,
                              flex2: 1,
                              image1: AppImage.image2,
                              image2: AppImage.image6,
                            ),
                            SizedBox(
                              height: 16 * size,
                            ),
                            pageViewImage(
                              size: size,
                              flex1: 1,
                              flex2: 2,
                              image1: AppImage.image7,
                              image2: AppImage.image8,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        height: 332 * size,
                        child: Column(
                          children: [
                            pageViewImage(
                              size: size,
                              flex1: 2,
                              flex2: 1,
                              image1: AppImage.image9,
                              image2: AppImage.image10,
                            ),
                            SizedBox(
                              height: 16 * size,
                            ),
                            pageViewImage(
                              size: size,
                              flex1: 1,
                              flex2: 0,
                              image1: AppImage.image11,
                              image2: AppImage.image11,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40 * size),
                Expanded(
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 40 * size),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade50,
                          offset: Offset(-2, -2),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28 * size),
                        topRight: Radius.circular(28 * size),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32 * size),
                        CommonText(
                          text: 'Read the article you\nwant instantly',
                          size: 24 * size,
                          color: AppColor.textColor,
                          weight: FontWeight.w800,
                        ),
                        SizedBox(height: 16 * size),
                        CommonText(
                          text:
                              'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.',
                          size: 14 * size,
                          height: 2,
                          color: AppColor.darkBlueColor,
                          weight: FontWeight.w300,
                        ),
                        SizedBox(height: 27 * size),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ...List.generate(
                                  3,
                                  (index) => Container(
                                    height: 6 * size,
                                    width: controller.selectPage == index
                                        ? 23 * size
                                        : 6 * size,
                                    margin: EdgeInsets.only(right: 8 * size),
                                    decoration: BoxDecoration(
                                      color: controller.selectPage == index
                                          ? AppColor.mainColor
                                          : AppColor.lightBlueColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 60 * size,
                              width: 88 * size,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppColor.mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12 * size),
                                  ),
                                ),
                                onPressed: () {
                                  if (controller.selectPage < 2) {
                                    pageController.nextPage(
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeIn);
                                  } else {
                                    Get.offAll(() => AuthenticationScreen());
                                  }
                                },
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppImage.arrow,
                                    height: 24 * size,
                                    width: 24 * size,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget pageViewImage(
    {String? image1,
    String? image2,
    int? flex1 = 1,
    int? flex2 = 2,
    double? size}) {
  return Expanded(
    child: Row(
      children: [
        Expanded(
          flex: flex1!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25 * size!),
              image: DecorationImage(
                image: AssetImage(image1!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 12 * size),
        Expanded(
          flex: flex2!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25 * size),
              image: DecorationImage(
                image: AssetImage(image2!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
