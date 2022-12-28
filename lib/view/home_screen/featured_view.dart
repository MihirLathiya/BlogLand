import 'package:blog_land/view/home_screen/home_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:flutter/material.dart';

class FeaturedView extends StatefulWidget {
  const FeaturedView({Key? key}) : super(key: key);

  @override
  State<FeaturedView> createState() => _FeaturedViewState();
}

class _FeaturedViewState extends State<FeaturedView> {
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
          text: 'Featured',
          size: 16 * font,
          weight: FontWeight.w800,
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: AppColor.textColor,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView.separated(
        padding:
            EdgeInsets.symmetric(horizontal: 10 * size, vertical: 10 * size),
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return FeaturedData(size, font);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10 * size,
          );
        },
      ),
    );
  }
}
