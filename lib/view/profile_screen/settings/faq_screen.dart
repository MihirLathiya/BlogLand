import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
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
          text: 'FAQ',
          size: 18 * font,
          weight: FontWeight.w800,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26 * size),
          child: Column(
            children: [
              SizedBox(
                height: 30 * size,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.mainColor),
                      borderRadius: BorderRadius.circular(10 * size),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        textColor: AppColor.blackColor,
                        collapsedTextColor: AppColor.blackColor,
                        iconColor: Colors.white,
                        onExpansionChanged: (val) {},
                        trailing: SvgPicture.asset(
                          AppImage.arrow3,
                          height: 24 * size,
                          width: 24 * size,
                        ),
                        collapsedIconColor: Colors.white,
                        childrenPadding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        title: CommonText(
                            size: 14 * size,
                            weight: FontWeight.w500,
                            height: 1.8,
                            text: "How to make offer on Blogland"),
                        children: [
                          Divider(
                            thickness: 1,
                            color: Colors.grey.shade200,
                            indent: 2,
                            endIndent: 2,
                          ),
                          CommonText(
                              size: 12 * size,
                              weight: FontWeight.w300,
                              height: 1.8,
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10 * size,
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
