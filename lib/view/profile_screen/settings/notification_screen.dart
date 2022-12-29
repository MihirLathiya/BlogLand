import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({Key? key}) : super(key: key);

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
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
          text: 'Notification',
          size: 16 * font,
          weight: FontWeight.w800,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26 * size),
        child: Column(
          children: [
            SizedBox(
              height: 20 * size,
            ),
            ListTile(
              leading: CommonText(
                text: 'Sound',
                size: 14 * size,
                weight: FontWeight.w500,
              ),
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              leading: CommonText(
                text: 'Vibrate',
                size: 14 * size,
                weight: FontWeight.w500,
              ),
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (val) {},
              ),
            ),
            Divider(thickness: 1),
            ListTile(
              leading: CommonText(
                text: 'New tips available',
                size: 14 * size,
                weight: FontWeight.w500,
              ),
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (val) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
