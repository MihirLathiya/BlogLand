import 'package:blog_land/controller/profile_controller.dart';
import 'package:blog_land/view/home_screen/home_screen.dart';
import 'package:blog_land/view/profile_screen/settings/setting_screen.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    tabController =
        TabController(length: profileController.tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 812;
    final size = MediaQuery.of(context).size.height / baseWidth;
    double font = size * 0.97;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.transparent,
        title: CommonText(
          text: 'Profile',
          size: 16 * font,
          weight: FontWeight.w800,
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              Get.to(()=>SettingScreen());
            },
            icon: SvgPicture.asset(
              AppImage.setting,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15 * size),
        child: Center(
          child: GetBuilder<ProfileController>(
            builder: (controller) {
              return Column(
                children: [
                  SizedBox(height: 20 * size),
                  Stack(
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
                  CommonText(
                    text: 'Jone Doe',
                    size: 24 * font,
                    weight: FontWeight.w800,
                  ),
                  SizedBox(height: 10 * size),
                  CommonText(
                    text:
                        'Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry. Lorem Ipsum has been the industry\'s',
                    size: 12 * font,
                    height: 1.7,
                    weight: FontWeight.w300,
                  ),
                  SizedBox(height: 20 * size),
                  Row(
                    children: [
                      viewerView(font: font, name: 'Bloga', count: '133.2k'),
                      Container(
                        height: 40 * size,
                        width: 1 * size,
                        color: AppColor.lightBlueColor,
                      ),
                      viewerView(font: font, name: 'Followers', count: '10.2M'),
                      Container(
                        height: 40 * size,
                        width: 1 * size,
                        color: AppColor.lightBlueColor,
                      ),
                      viewerView(font: font, name: 'Following', count: '124'),
                    ],
                  ),
                  SizedBox(height: 20 * size),
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: Container(
                      height: 40 * size,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: AppColor.mainColor,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: 'Website',
                        size: 16 * font,
                        weight: FontWeight.w500,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * size,
                  ),
                  TabBar(
                    controller: tabController,
                    onTap: (val) {
                      controller.updateTab(val);
                    },
                    indicatorColor: AppColor.mainColor,
                    tabs: [
                      ...List.generate(
                        controller.tabs.length,
                        (index) => CommonText(
                          text: controller.tabs[index],
                          color: AppColor.mainColor,
                          weight: FontWeight.w800,
                          size: 18 * size,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20 * size,
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return blogDetails(size, font);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10 * size,
                              );
                            },
                            itemCount: 5),
                        ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return blogDetails(size, font);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10 * size,
                              );
                            },
                            itemCount: 5),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20 * size,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Expanded viewerView({
    double? font,
    String? name,
    String? count,
  }) {
    return Expanded(
      child: Column(
        children: [
          CommonText(
            text: name!,
            size: 18 * font!,
            weight: FontWeight.w800,
          ),
          CommonText(
            text: count!,
            size: 14 * font,
            height: 1.5,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
