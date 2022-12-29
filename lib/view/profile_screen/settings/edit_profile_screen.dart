import 'package:blog_land/view/add_blog/add_blog_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          text: 'Edit profile',
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
                height: 20 * size,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 100 * size,
                      width: 100 * size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        AppImage.userImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 12 * size,
                        backgroundColor: AppColor.mainColor,
                        child: FittedBox(
                          child: Icon(
                            Icons.edit,
                            color: AppColor.whiteColor,
                            size: 15 * size,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20 * size,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 20 * size,
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
                text: 'User name*',
                size: 12 * font,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 10 * size,
              ),
              buildTextFormField(
                  textEditingController: TextEditingController(),
                  textInputAction: TextInputAction.next,
                  hintText: 'User name'),
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
                height: 20 * size,
              ),
              CommonText(
                text: 'About*',
                size: 12 * font,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 10 * size,
              ),
              buildTextFormField(
                textEditingController: TextEditingController(),
                textInputAction: TextInputAction.next,
                hintText: 'About',
                maxLine: 2,
              ),
              SizedBox(
                height: 20 * size,
              ),
              CommonText(
                text: 'Website*',
                size: 12 * font,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 10 * size,
              ),
              buildTextFormField(
                  textEditingController: TextEditingController(),
                  textInputAction: TextInputAction.next,
                  hintText: 'Website'),
              SizedBox(
                height: 20 * size,
              ),
              CommonButton(
                width: Get.width,
                height: 40 * size,
                color: AppColor.mainColor,
                radius: 10 * size,
                text: 'Save changes',
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
