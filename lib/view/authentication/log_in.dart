import 'package:blog_land/controller/passwordController.dart';
import 'package:blog_land/view/authentication/authentication_screen.dart';
import 'package:blog_land/view/bottom_bar.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:blog_land/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInView extends StatefulWidget {
  final double? size;
  final double? font;
  const LogInView({Key? key, this.size, this.font}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  PasswordController passwordController = Get.put(PasswordController());
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
              text: 'Welcome back',
              size: 24 * widget.font!,
              weight: FontWeight.w800,
            ),
            SizedBox(height: 5 * widget.size!),
            CommonText(
              text: 'Sign in with your account',
              size: 14 * widget.font!,
              weight: FontWeight.w400,
            ),
            SizedBox(height: 30 * widget.size!),
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
              text: 'Password',
              size: 14 * widget.font!,
              weight: FontWeight.w400,
            ),
            Obx(
              () => SizedBox(
                height: 42 * widget.size!,
                child: TextFormField(
                  controller: password,
                  obscureText: passwordController.isShow.value,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10 * widget.size!),
                    suffix: TextButton(
                      onPressed: () {
                        passwordController.updateValue();
                      },
                      child: CommonText(
                        text: passwordController.isShow.value ? 'SHOW' : 'HIDE',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20 * widget.size!),
            Align(
              alignment: Alignment.center,
              child: CommonButton(
                color: AppColor.mainColor,
                text: 'Login',
                height: 60 * widget.size!,
                onPress: () {
                  if (userName.text.isNotEmpty && password.text.isNotEmpty) {
                    Get.offAll(() => AppBottomBar());
                    commonSnackBar('Login Successfully',
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
            SizedBox(height: 20 * widget.size!),
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
