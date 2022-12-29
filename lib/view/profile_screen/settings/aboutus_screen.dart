import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.transparent,
        leading: backButton(),
        title: CommonText(
          text: 'About Us',
          size: 18 * font,
          weight: FontWeight.w800,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * size),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30 * size,
                ),
                SvgPicture.asset(
                  AppImage.logo,
                  height: 56 * size,
                  width: 116 * size,
                ),
                SizedBox(
                  height: 20 * size,
                ),
                CommonText(
                  text: 'We Focus on the digital blog',
                  size: 16 * font,
                  weight: FontWeight.w800,
                ),
                SizedBox(
                  height: 20 * size,
                ),
                CommonText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  size: 14 * font,
                  height: 1.8,
                  weight: FontWeight.w300,
                ),
                SizedBox(
                  height: 20 * size,
                ),
                CommonText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  height: 1.8,
                  weight: FontWeight.w300,
                ),
                SizedBox(
                  height: 20 * size,
                ),
                CommonText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  weight: FontWeight.w300,
                  height: 1.8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
