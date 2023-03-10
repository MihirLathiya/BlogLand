import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CommonButton extends StatelessWidget {
  final height, width, radius, textSize;
  final onPress;
  final String? text;
  final Color? color, textColor;
  final FontWeight? textWeight;
  const CommonButton(
      {Key? key,
      this.height,
      this.width,
      this.onPress,
      this.text,
      this.color,
      this.radius,
      this.textSize,
      this.textColor,
      this.textWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPress,
        child: CommonText(
          text: text!,
          color: textColor,
          size: textSize,
          weight: textWeight,
        ),
      ),
    );
  }
}

Widget backButton() {
  return IconButton(
    splashRadius: 20,
    onPressed: () {
      Get.back();
    },
    icon: SvgPicture.asset(
      AppImage.backButton,
      height: 24,
      width: 24,
    ),
  );
}
