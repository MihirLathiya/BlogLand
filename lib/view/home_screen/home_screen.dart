import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return Scaffold(
      body: Column(
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
                SvgPicture.asset(
                  AppImage.notification,
                  height: 23 * size,
                  width: 23 * size,
                ),
              ],
            ),
          ),
          SizedBox(height: 20 * size),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  5,
                  (index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              right: 10 * size,
                              left: index == 0 ? 26 * size : 0),
                          height: 68 * size,
                          width: 68 * size,
                          padding: EdgeInsets.all(7 * size),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24 * size),
                            border: Border.all(color: AppColor.mainColor),
                          ),
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18 * size),
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
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
