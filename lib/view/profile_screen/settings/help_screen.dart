import 'package:blog_land/view/profile_screen/settings/aboutus_screen.dart';
import 'package:blog_land/view/profile_screen/settings/contact_us_screen.dart';
import 'package:blog_land/view/profile_screen/settings/faq_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<String> menu = [
    "FAQ",
    "Contact us",
    "Terms & Conditions",
    "Privay Policy",
    "About Us",
  ];
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
          text: 'Help',
          size: 16 * font,
          weight: FontWeight.w800,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16 * size),
          child: Column(
            children: [
              SizedBox(
                height: 20 * size,
              ),
              ListView.separated(
                itemCount: menu.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      if (index == 0) {
                        Get.to(() => FaqScreen());
                      }
                      if (index == 1) {
                        Get.to(() => ContactUsScreen());
                      }
                      if (index == 2) {}
                      if (index == 3) {}
                      if (index == 4) {
                        Get.to(() => AboutUsScreen());
                      }
                    },
                    title: CommonText(
                      text: menu[index],
                      weight: FontWeight.w500,
                      size: 15 * font,
                    ),
                    trailing: Transform.rotate(
                      angle: 3.1,
                      child: SvgPicture.asset(
                        AppImage.backButton,
                        color: Color(0xff376AED),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 20 * size,
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
