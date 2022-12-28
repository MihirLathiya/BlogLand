import 'dart:async';

import 'package:blog_land/prefrence_manager/prefrence_manager.dart';
import 'package:blog_land/view/bottom_bar.dart';
import 'package:blog_land/view/on_boarding_screen.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Get.offAll(
          () => PreferenceManager.getEmail() == null ||
                  PreferenceManager.getEmail() == ''
              ? OnBoardingScreen()
              : AppBottomBar(),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.decoration),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImage.logo),
          ],
        ),
      ),
    );
  }
}
