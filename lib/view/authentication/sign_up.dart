import 'package:blog_land/view/authentication/authentication_screen.dart';
import 'package:blog_land/view/bottom_bar.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:blog_land/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  final double? size;
  final double? font;
  const SignUpView({Key? key, this.size, this.font}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40 * widget.size!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30 * widget.size!),
            CommonText(
              text: 'Welcome',
              size: 24 * widget.font!,
              weight: FontWeight.w800,
            ),
            SizedBox(height: 5 * widget.size!),
            CommonText(
              text: 'Create your account',
              size: 14 * widget.font!,
              weight: FontWeight.w400,
            ),
            SizedBox(height: 20 * widget.size!),
            CommonText(
              text: 'Username',
              size: 14 * widget.font!,
              weight: FontWeight.w400,
            ),
            SizedBox(
              height: 42 * widget.size!,
              child: TextFormField(
                controller: userName,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10 * widget.size!),
                ),
              ),
            ),
            SizedBox(height: 20 * widget.size!),
            CommonText(
              text: 'Email',
              size: 14 * widget.font!,
              weight: FontWeight.w400,
            ),
            SizedBox(
              height: 42 * widget.size!,
              child: TextFormField(
                controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10 * widget.size!),
                ),
              ),
            ),
            SizedBox(height: 20 * widget.size!),
            CommonText(
              text: 'Password',
              size: 14 * widget.font!,
              weight: FontWeight.w400,
            ),
            SizedBox(
              height: 42 * widget.size!,
              child: TextFormField(
                controller: password,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10 * widget.size!),
                ),
              ),
            ),
            SizedBox(height: 20 * widget.size!),
            Align(
              alignment: Alignment.center,
              child: CommonButton(
                color: AppColor.mainColor,
                text: 'SIGNUP',
                height: 60 * widget.size!,
                onPress: () {
                  if (userName.text.isNotEmpty &&
                      password.text.isNotEmpty &&
                      email.text.isNotEmpty) {
                    Get.offAll(() => AppBottomBar());

                    commonSnackBar('SignUp Successfully',
                        snackBarBackGroundColor: AppColor.mainColor);
                  } else {
                    commonSnackBar('Fill necessary details');
                  }
                },
                textSize: 16 * widget.font!,
                textWeight: FontWeight.w800,
                radius: 12 * widget.size!,
                width: 295 * widget.size!,
              ),
            ),
            SizedBox(height: 10 * widget.size!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: 'Forgot your password?',
                  weight: FontWeight.w400,
                  size: 14 * widget.size!,
                ),
                TextButton(
                  onPressed: () {},
                  child: CommonText(
                    text: 'Reset here',
                    weight: FontWeight.w500,
                    size: 14 * widget.font!,
                    color: AppColor.mainColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 20 * widget.size!),
            Align(
              alignment: Alignment.center,
              child: CommonText(
                text: 'Or sign in with',
                weight: FontWeight.w400,
                size: 12 * widget.size!,
              ),
            ),
            SizedBox(height: 10 * widget.size!),
            socialAuth(
              googlePath: AppImage.google,
              googleOnTap: () {},
              facebookPath: AppImage.facebook,
              facebookOnTap: () {},
              twitterPath: AppImage.twitter,
              twitterOnTap: () {},
              size: widget.size,
            )
          ],
        ),
      ),
    );
  }
}
