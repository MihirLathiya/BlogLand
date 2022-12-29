import 'package:blog_land/view/add_blog/add_blog_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
          text: 'Connect Us',
          size: 18 * font,
          weight: FontWeight.w800,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26 * size),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30 * size,
              ),
              CommonText(
                text: 'Full Name*',
                size: 12 * font,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 10 * size,
              ),
              buildTextFormField(
                  textEditingController: TextEditingController(),
                  textInputAction: TextInputAction.next,
                  hintText: 'Full Name'),
              SizedBox(
                height: 20 * size,
              ),
              CommonText(
                text: 'Email*',
                size: 12 * font,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 10 * size,
              ),
              buildTextFormField(
                  textEditingController: TextEditingController(),
                  textInputAction: TextInputAction.next,
                  hintText: 'Email'),
              SizedBox(
                height: 10 * size,
              ),
              SizedBox(
                height: 20 * size,
              ),
              CommonText(
                text: 'Message*',
                size: 12 * font,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 10 * size,
              ),
              buildTextFormField(
                textEditingController: TextEditingController(),
                textInputAction: TextInputAction.next,
                hintText: 'Message',
                maxLine: 5,
              ),
              SizedBox(
                height: 200 * size,
              ),
              CommonButton(
                width: Get.width,
                height: 40 * size,
                color: AppColor.mainColor,
                radius: 10 * size,
                text: 'Send Message',
                onPress: () {},
                textSize: 16 * size,
                textColor: AppColor.whiteColor,
                textWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 20 * size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
