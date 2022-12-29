import 'package:blog_land/prefrence_manager/prefrence_manager.dart';
import 'package:blog_land/view/authentication/authentication_screen.dart';
import 'package:blog_land/view/profile_screen/settings/edit_profile_screen.dart';
import 'package:blog_land/view/profile_screen/settings/help_screen.dart';
import 'package:blog_land/view/profile_screen/settings/notification_screen.dart';
import 'package:blog_land/view/profile_screen/settings/security_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:blog_land/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Map<String, dynamic>> menu = [
    {"Name": "Edit profile", "Image": AppImage.Profile},
    {"Name": "Notification", "Image": AppImage.Notification1},
    {"Name": "Security", "Image": AppImage.Lock},
    {"Name": "Help", "Image": AppImage.FAQ},
    {"Name": "Invite Friends", "Image": AppImage.Group},
    {"Name": "Logout", "Image": AppImage.Logout},
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
          text: 'Settings ',
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
                itemCount: 6,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      if (index == 0) {
                        Get.to(() => EditProfileScreen());
                      }
                      if (index == 1) {
                        Get.to(() => NotificationSettingScreen());
                      }
                      if (index == 2) {
                        Get.to(() => SecuritySettingScreen());
                      }
                      if (index == 3) {
                        Get.to(() => HelpScreen());
                      }
                      if (index == 4) {}
                      if (index == 5) {
                        showModalBottomSheet(
                          backgroundColor: AppColor.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(32 * size),
                              height: 207 * size,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40 * size),
                                  topRight: Radius.circular(40 * size),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 40 * size,
                                    width: 40 * size,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff376AED).withAlpha(100),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppImage.Logout,
                                        height: 28 * size,
                                        width: 28 * size,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10 * size,
                                  ),
                                  CommonText(
                                    text: 'Are you Sure want to logout?',
                                    size: 16 * size,
                                    weight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 20 * size,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CommonButton(
                                          width: 255 * size,
                                          height: 40 * size,
                                          color: AppColor.mainColor,
                                          radius: 10 * size,
                                          text: 'Yes, Logout',
                                          onPress: () {
                                            PreferenceManager.getClear();
                                            Get.offAll(
                                                () => AuthenticationScreen());
                                            commonSnackBar(
                                              'Log out Successfully',
                                              snackBarBackGroundColor:
                                                  AppColor.mainColor,
                                            );
                                          },
                                          textSize: 16 * size,
                                          textColor: AppColor.whiteColor,
                                          textWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20 * size,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10 * size),
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 40 * size,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10 * size,
                                              ),
                                              border: Border.all(
                                                color: AppColor.mainColor,
                                              ),
                                            ),
                                            child: Center(
                                              child: CommonText(
                                                text: 'Cancel',
                                                size: 16 * font,
                                                weight: FontWeight.w600,
                                                color: AppColor.mainColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    leading: Container(
                      height: 30 * size,
                      width: 30 * size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff376AED).withAlpha(100),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          menu[index]['Image'],
                          height: 18 * size,
                          width: 18 * size,
                        ),
                      ),
                    ),
                    title: CommonText(
                      text: menu[index]['Name'],
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
