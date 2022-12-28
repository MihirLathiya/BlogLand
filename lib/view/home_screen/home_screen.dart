import 'package:blog_land/controller/home_screen_controller.dart';
import 'package:blog_land/view/home_screen/featured_view.dart';
import 'package:blog_land/view/notification/notification_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return Scaffold(
      body: GetBuilder<HomeScreenController>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 64 * size),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26 * size),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'Hi, Jonathan!',
                            size: 18 * font,
                            color: AppColor.textColor,
                          ),
                          CommonText(
                            text: 'Explore today’s',
                            size: 24 * font,
                            weight: FontWeight.w800,
                            color: AppColor.textColor,
                          ),
                        ],
                      ),
                      InkWell(
                        // splashRadius: 25,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Get.to(() => NotificationScreen());
                        },
                        child: SvgPicture.asset(
                          AppImage.notification,
                          height: 23 * size,
                          width: 23 * size,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20 * size),

                /// Story View
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: 10 * size,
                                      left: index == 0 ? 26 * size : 0),
                                  height: 68 * size,
                                  width: 68 * size,
                                  padding: EdgeInsets.all(7 * size),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(24 * size),
                                    border:
                                        Border.all(color: AppColor.mainColor),
                                  ),
                                  child: Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(18 * size),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff376AED),
                                          Color(0xff49B0E2),
                                          Color(0xff9CECFB),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: index == 0
                                        ? Icon(
                                            Icons.add,
                                            color: AppColor.whiteColor,
                                            size: 30 * size,
                                          )
                                        : Image.asset(
                                            AppImage.image1,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                SizedBox(height: 5 * size),
                                Align(
                                  alignment: Alignment.center,
                                  child: CommonText(
                                    text: index == 0 ? 'Your Story' : 'HELLO',
                                    size: 12 * font,
                                    color: AppColor.textColor,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20 * size),
                heading(
                  font: size,
                  buttonName: 'More',
                  onPress: () {
                    Get.to(() => FeaturedView());
                  },
                  title: 'Featured',
                ),

                /// FEATURE VIEW
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return FeaturedData(size, font);
                  },
                  options: CarouselOptions(
                    height: 220 * size,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    initialPage: 0,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    onPageChanged:
                        (int val, CarouselPageChangedReason reason) {},
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 20 * size),
                heading(
                  font: size,
                  buttonName: 'More',
                  onPress: () {},
                  title: 'Latest Blogs',
                ),
                SizedBox(height: 10 * size),

                /// LATEST BLOG  VIEW
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              controller.updateSelectBlog(index);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 10 * size,
                                  left: index == 0 ? 26 * size : 0),
                              height: 30 * size,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15 * size, vertical: 6 * size),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6 * size),
                                border: Border.all(color: AppColor.mainColor),
                                color: controller.selectBlog == index
                                    ? AppColor.mainColor
                                    : AppColor.transparent,
                              ),
                              child: CommonText(
                                text: 'Hello',
                                size: 12 * font,
                                weight: FontWeight.w800,
                                color: controller.selectBlog == index
                                    ? AppColor.whiteColor
                                    : AppColor.mainColor,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20 * size),

                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.symmetric(horizontal: 26 * size),
                      height: 150 * size,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(26 * size),
                          bottom: Radius.circular(26 * size),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppImage.blog2,
                            width: 105 * size,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10 * size),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CommonText(
                                  text:
                                      'Wow! USA Develops New Way Of Faster and More',
                                  size: 15 * font,
                                  maxLine: 2,
                                  overFlow: TextOverflow.ellipsis,
                                  weight: FontWeight.w800,
                                ),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(1000),
                                      child: Image.asset(
                                        AppImage.bccNews,
                                        height: 30 * size,
                                        width: 30 * size,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10 * size),
                                    CommonText(
                                      text: 'BCC News',
                                      size: 10 * font,
                                      maxLine: 1,
                                      overFlow: TextOverflow.ellipsis,
                                      weight: FontWeight.w800,
                                    ),
                                    SizedBox(width: 10 * size),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 9 * size, vertical: 2),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6 * size),
                                        border: Border.all(
                                            color: AppColor.textColor),
                                      ),
                                      child: CommonText(
                                        text: 'Health',
                                        size: 10 * font,
                                        weight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.like,
                                      height: 18 * size,
                                      width: 18 * size,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 10 * size),
                                    CommonText(
                                      text: '366K',
                                      size: 12 * font,
                                    ),
                                    SizedBox(width: 10 * size),
                                    SvgPicture.asset(
                                      AppImage.comment,
                                      height: 18 * size,
                                      width: 18 * size,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 10 * size),
                                    CommonText(
                                      text: '366K',
                                      size: 12 * font,
                                    ),
                                    Spacer(),
                                    SvgPicture.asset(
                                      AppImage.saved,
                                      height: 18 * size,
                                      width: 18 * size,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 10 * size),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10 * size,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Container FeaturedData(double size, double font) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10 * size),
    height: 220 * size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18 * size),
      image: DecorationImage(
        image: AssetImage(AppImage.blog1),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20 * size, vertical: 10 * size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18 * size),
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Color(0xff0D253C),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CommonText(
              text: 'WAR : Russia ukraine war',
              size: 14 * font,
              maxLine: 1,
              overFlow: TextOverflow.ellipsis,
              weight: FontWeight.w800,
              color: AppColor.whiteColor,
            ),
          ),
          SizedBox(width: 5 * size),
          CommonButton(
            color: AppColor.mainColor,
            height: 24 * size,
            width: 80 * size,
            onPress: () {},
            radius: 6 * size,
            text: 'Read More',
            textColor: AppColor.whiteColor,
            textSize: 10 * size,
          )
        ],
      ),
    ),
  );
}

Widget heading({String? title, String? buttonName, onPress, double? font}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 26 * font!),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: title!,
          size: 16 * font,
          weight: FontWeight.w800,
        ),
        TextButton(
          onPressed: onPress,
          child: CommonText(
            text: buttonName!,
            size: 14 * font,
            weight: FontWeight.w500,
            color: AppColor.mainColor,
          ),
        )
      ],
    ),
  );
}
