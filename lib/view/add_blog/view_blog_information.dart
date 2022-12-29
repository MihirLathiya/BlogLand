import 'package:blog_land/view/home_screen/home_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ViewBlogInformationScreen extends StatefulWidget {
  const ViewBlogInformationScreen({Key? key}) : super(key: key);

  @override
  State<ViewBlogInformationScreen> createState() =>
      _ViewBlogInformationScreenState();
}

class _ViewBlogInformationScreenState extends State<ViewBlogInformationScreen> {
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
        leading: backButton(),
        actions: [
          Transform.rotate(
            angle: 3.2,
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                AppImage.Upload,
                height: 20 * size,
                width: 20 * size,
              ),
            ),
          ),
          SizedBox(
            width: 20 * size,
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              AppImage.saved,
              height: 18 * size,
              width: 18 * size,
            ),
          ),
          SizedBox(
            width: 10 * size,
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: AppColor.textColor,
            ),
          ),
          SizedBox(
            width: 10 * size,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26 * size),
          child: Column(
            children: [
              SizedBox(
                width: 20 * size,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(18 * size),
                child: Image.asset(
                  AppImage.blog1,
                  height: 240 * size,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20 * size,
              ),
              CommonText(
                text:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                size: 18 * font,
                weight: FontWeight.w800,
              ),
              SizedBox(
                height: 10 * size,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppImage.like,
                    height: 18 * size,
                    width: 18 * size,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10 * size),
                  CommonText(
                    text: '366K',
                    size: 10 * font,
                  ),
                  SizedBox(width: 10 * size),
                  SvgPicture.asset(
                    AppImage.comment,
                    height: 18 * size,
                    width: 18 * size,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10 * size),
                  CommonText(
                    text: '366K',
                    size: 10 * font,
                  ),
                ],
              ),
              SizedBox(
                height: 14 * size,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.asset(
                      AppImage.bccNews,
                      height: 30 * size,
                      width: 30 * size,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10 * size),
                  CommonText(
                    text: 'BCC News',
                    size: 14 * font,
                    maxLine: 1,
                    overFlow: TextOverflow.ellipsis,
                    weight: FontWeight.w800,
                  ),
                  Spacer(),
                  InkWell(
                    radius: 6 * size,
                    borderRadius: BorderRadius.circular(6 * size),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 9 * size, vertical: 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6 * size),
                        border: Border.all(color: AppColor.mainColor),
                      ),
                      child: CommonText(
                        text: 'Following',
                        size: 10 * font,
                        color: AppColor.mainColor,
                        weight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 23 * size,
              ),
              CommonText(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.",
                height: 1.8,
                size: 16 * size,
                weight: FontWeight.w300,
              ),
              SizedBox(
                height: 20 * size,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(18 * size),
                child: Image.asset(
                  AppImage.blog1,
                  height: 146 * size,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20 * size,
              ),
              CommonText(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                height: 1.8,
                size: 16 * size,
                weight: FontWeight.w300,
              ),
              SizedBox(
                height: 20 * size,
              ),
              Wrap(
                runSpacing: 10 * size,
                spacing: 10 * size,
                children: [
                  ...List.generate(
                    7,
                    (index) {
                      return Container(
                        padding: EdgeInsets.all(6 * size),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4 * size),
                            border: Border.all(color: AppColor.mainColor)),
                        child: CommonText(
                          text: '# Health',
                          size: 10 * font,
                          color: AppColor.mainColor,
                          weight: FontWeight.w800,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20 * size,
              ),
              Row(
                children: [
                  CommonText(
                    text: 'Is this blog helpful ?',
                    size: 18 * size,
                    weight: FontWeight.w800,
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    AppImage.fav,
                    height: 20 * size,
                    width: 20 * size,
                  ),
                  CommonText(
                    text: ' 366K',
                    size: 10 * font,
                  ),
                  SizedBox(
                    width: 12 * size,
                  ),
                  SvgPicture.asset(
                    AppImage.unFav,
                    height: 20 * size,
                    width: 20 * size,
                  ),
                  CommonText(
                    text: ' 366K',
                    size: 10 * font,
                  ),
                ],
              ),
              SizedBox(
                height: 20 * size,
              ),
              Container(
                padding: EdgeInsets.all(20 * size),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15 * size),
                  border: Border.all(
                    color: AppColor.lightBlueColor,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CommonText(
                          text: 'Comments',
                          size: 16 * size,
                          weight: FontWeight.w800,
                        ),
                        SizedBox(
                          width: 10 * size,
                        ),
                        CommonText(
                          text: '170.5K',
                          size: 16 * size,
                          weight: FontWeight.w800,
                          color: AppColor.mainColor,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: AppColor.lightBlueColor,
                    ),
                    SizedBox(
                      height: 10 * size,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.asset(
                            AppImage.bccNews,
                            height: 40 * size,
                            width: 40 * size,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10 * size,
                        ),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 16 * font, fontFamily: 'Avenir'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20 * size),
                                borderSide: BorderSide(
                                  color: AppColor.lightBlueColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20 * size),
                                borderSide: BorderSide(
                                  color: AppColor.lightBlueColor,
                                ),
                              ),
                              hintText: 'Add a comments ...',
                              hintStyle: TextStyle(
                                color: AppColor.lightBlueColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 16 * font,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15 * size,
              ),
              Divider(
                thickness: 1,
                color: AppColor.lightBlueColor,
              ),
              SizedBox(
                height: 15 * size,
              ),
              heading(
                font: size,
                buttonName: 'More',
                onPress: () {},
                title: 'Related Blogs',
              ),
              SizedBox(
                height: 15 * size,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return blogDetails(size, font);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10 * size,
                    );
                  },
                  itemCount: 2),
              SizedBox(
                height: 15 * size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
