import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final double? height;
  final String family;
  final double? latterSpace;
  final double? wordSpace;
  final TextOverflow? overFlow;
  final int? maxLine;
  final TextAlign? textAlign;
  const CommonText(
      {super.key,
      required this.text,
      this.size = 15,
      this.color = const Color(0xff0D253C),
      this.weight,
      this.height,
      this.family = 'Avenir',
      this.latterSpace,
      this.wordSpace,
      this.overFlow,
      this.maxLine,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: overFlow,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: family,
        color: color,
        fontSize: size,
        height: height,
        fontWeight: weight,
        wordSpacing: wordSpace,
      ),
      /* style: GoogleFonts.getFont(
        family,
        wordSpacing: wordSpace,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      ),*/
    );
  }
}
