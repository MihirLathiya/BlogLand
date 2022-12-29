import 'package:blog_land/controller/add_blog_controller.dart';
import 'package:blog_land/controller/bottom_bar_controller.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({Key? key}) : super(key: key);

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  AddBlogController addBlogController = Get.put(AddBlogController());
  BottomBarController barController = BottomBarController();
  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.transparent,
        title: CommonText(
          text: 'Create Blog',
          size: 18 * font,
          weight: FontWeight.w800,
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: AppColor.textColor,
            ),
          )
        ],
      ),
      body: GetBuilder<AddBlogController>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 26 * size),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10 * size,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: DottedBorder(
                      radius: Radius.circular(26 * size),
                      color: AppColor.mainColor,
                      borderType: BorderType.RRect,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.butt,
                      dashPattern: [8],
                      child: Container(
                        height: 138 * size,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24 * size),
                          color: AppColor.lightBlueColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppImage.plus,
                              color: AppColor.mainColor,
                            ),
                            SizedBox(
                              height: 10 * size,
                            ),
                            CommonText(
                              text: 'Add cover photos',
                              size: 14 * size,
                              weight: FontWeight.w800,
                              color: AppColor.mainColor,
                            )
                          ],
                        ),
                      ),
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
                    text: 'Blogs Details',
                    size: 16 * size,
                    weight: FontWeight.w800,
                    color: AppColor.textColor,
                  ),
                  SizedBox(
                    height: 20 * size,
                  ),
                  CommonText(
                    text: 'Blog Title*',
                    size: 12 * font,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10 * size,
                  ),
                  buildTextFormField(
                      textEditingController: controller.titleController,
                      textInputAction: TextInputAction.next,
                      hintText: 'Blog Title'),
                  SizedBox(
                    height: 20 * size,
                  ),
                  CommonText(
                    text: 'Blog Sub-title*',
                    size: 12 * font,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10 * size,
                  ),
                  buildTextFormField(
                    textEditingController: controller.subTitleController,
                    hintText: 'Blog Sub-title',
                    maxLine: 2,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20 * size,
                  ),
                  CommonText(
                    text: 'Main Tag*',
                    size: 12 * font,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10 * size,
                  ),
                  Container(
                    height: 50 * size,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10 * size),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xffD9DFEB),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: SvgPicture.asset(
                          AppImage.arrowDown,
                          height: 24 * size,
                          width: 24 * size,
                        ),
                        hint: Text(
                          controller.selectTag != ''
                              ? controller.selectTag
                              : 'Add Tag',
                          style: TextStyle(
                              color: controller.selectTag != ''
                                  ? Colors.black
                                  : Color(0xffD9DFEB)),
                        ),
                        items: controller.blogTag.map(
                          (e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          },
                        ).toList(),
                        onChanged: (String? value) {
                          controller.updateTag(value!);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * size,
                  ),
                  CommonText(
                    text: 'Blog Text*',
                    size: 12 * font,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10 * size,
                  ),
                  buildTextFormField(
                    textEditingController: controller.blogTextController,
                    hintText: 'Type Blog Here',
                    textInputAction: TextInputAction.next,
                    maxLine: 5,
                  ),
                  SizedBox(
                    height: 20 * size,
                  ),
                  CommonText(
                    text: 'Tags*',
                    size: 12 * font,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10 * size,
                  ),
                  buildTextFormField(
                    textEditingController: controller.tagsController,
                    hintText: 'Add Tag',
                    textInputAction: TextInputAction.done,
                    onSubmit: (val) async {
                      await controller.addTage(value: val);
                      controller.tagsController.clear();
                    },
                  ),
                  if (controller.tags.isNotEmpty)
                    SizedBox(
                      height: 10 * size,
                    ),
                  if (controller.tags.isNotEmpty)
                    Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        ...List.generate(
                          controller.tags.length,
                          (index) {
                            return Container(
                              padding: EdgeInsets.all(5 * size),
                              decoration: BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius: BorderRadius.circular(5 * size),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CommonText(
                                    text: controller.tags[index],
                                    size: 10 * size,
                                    weight: FontWeight.w300,
                                    color: AppColor.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 5 * size,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.removeTage(
                                          value: controller.tags[index]);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: AppColor.whiteColor,
                                      size: 20 * size,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40 * size,
                              width: 40 * size,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10 * size),
                                color: AppColor.lightBlueColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppImage.Upload,
                                  height: 24 * size,
                                  width: 24 * size,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20 * size,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40 * size,
                              width: 40 * size,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10 * size),
                                color: AppColor.lightBlueColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppImage.Calender,
                                  height: 24 * size,
                                  width: 24 * size,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CommonButton(
                        width: 130 * size,
                        height: 40 * size,
                        color: AppColor.mainColor,
                        radius: 10 * size,
                        text: 'Publish Blog',
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setStat) {
                                  return Center(
                                    child: Container(
                                      height: 404 * size,
                                      width: 315 * size,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30 * size),
                                      padding: EdgeInsets.all(30 * size),
                                      decoration: BoxDecoration(
                                        color: AppColor.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(18 * size),
                                      ),
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                            AppImage.addDone,
                                            height: 158 * size,
                                            width: 163 * size,
                                          ),
                                          SizedBox(
                                            height: 20 * size,
                                          ),
                                          CommonText(
                                            text:
                                                'Great! Your Blog Was\nSuccessfully Published',
                                            color: AppColor.mainColor,
                                            size: 16 * size,
                                            weight: FontWeight.w800,
                                            height: 1.7,
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 20 * size,
                                          ),
                                          CommonButton(
                                            width: 255 * size,
                                            height: 40 * size,
                                            color: AppColor.mainColor,
                                            radius: 10 * size,
                                            text: 'See Blogs',
                                            onPress: () {},
                                            textSize: 16 * size,
                                            textColor: AppColor.whiteColor,
                                            textWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 10 * size,
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 255 * size,
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
                                              alignment: Alignment.center,
                                              child: CommonText(
                                                text: 'Go To Home',
                                                size: 16 * size,
                                                weight: FontWeight.w500,
                                                color: AppColor.mainColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        textSize: 16 * size,
                        textColor: AppColor.whiteColor,
                        textWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 29 * size,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

TextFormField buildTextFormField(
    {TextEditingController? textEditingController,
    String? hintText,
    void Function(String)? onSubmit,
    TextInputAction? textInputAction,
    int maxLine = 1}) {
  return TextFormField(
    style: TextStyle(fontFamily: 'Avenir', fontWeight: FontWeight.w500),
    textInputAction: textInputAction,
    maxLines: maxLine,
    onFieldSubmitted: onSubmit,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Color(0xffD9DFEB)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Color(0xffD9DFEB),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Color(0xffD9DFEB),
        ),
      ),
    ),
  );
}
