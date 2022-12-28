import 'package:blog_land/controller/notification_controller.dart';
import 'package:blog_land/widget/app_color.dart';
import 'package:blog_land/widget/button.dart';
import 'package:blog_land/widget/common_text.dart';
import 'package:blog_land/widget/imagepath.dart';
import 'package:blog_land/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController notificationController =
      Get.put(NotificationController());
  @override
  void initState() {
    notificationController.filterData();
    super.initState();
  }

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
        title: CommonText(
          text: 'Notification',
          size: 16 * font,
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15 * size),
            child: GetBuilder<NotificationController>(
              builder: (controller) {
                return Column(
                  children: [
                    SizedBox(
                      height: 26 * size,
                    ),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: controller.showDate!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var currentDate =
                            DateTime.now().toString().split(' ').first;
                        var yesterday = DateTime.now()
                            .subtract(Duration(days: 1))
                            .toString()
                            .split(' ')
                            .first;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: controller.showDate![index] == currentDate
                                  ? 'Today ${controller.showDate![index]}'
                                  : controller.showDate![index] == yesterday
                                      ? 'Yesterday ${controller.showDate![index]}'
                                      : '${controller.showDate![index]}',
                              size: 14 * font,
                              weight: FontWeight.w700,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  (controller.notification['message'] as List)
                                      .length,
                              itemBuilder: (context, index1) {
                                return controller.notification['message']
                                            [index1]['createdAt'] ==
                                        controller.showDate![index]
                                    ? Column(
                                        children: [
                                          Slidable(
                                            actionPane:
                                                SlidableBehindActionPane(),
                                            actionExtentRatio: 0.25,
                                            secondaryActions: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18 * size),
                                                child: IconSlideAction(
                                                  color: Color.fromRGBO(
                                                      45, 67, 121, 0.2),
                                                  iconWidget: SvgPicture.asset(
                                                    AppImage.delete,
                                                    height: 24 * size,
                                                    width: 24 * size,
                                                  ),
                                                  onTap: () {
                                                    controller.removeData(
                                                        index1, index);
                                                    commonSnackBar(
                                                        'Notification Removed Successfully',
                                                        snackBarBackGroundColor:
                                                            AppColor.mainColor);
                                                  },
                                                ),
                                              )
                                            ],
                                            child: Container(
                                              height: 63 * size,
                                              width: Get.width,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10 * size),
                                              decoration: BoxDecoration(
                                                color: AppColor.whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18 * size),
                                                border: Border.all(
                                                  color: Color(0xffD9DFEB),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1000),
                                                    child: Image.asset(
                                                      AppImage.bccNews,
                                                      height: 39 * size,
                                                      width: 39 * size,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10 * size,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CommonText(
                                                          text:
                                                              'Devid Gutta is now follwing you',
                                                          maxLine: 2,
                                                          overFlow: TextOverflow
                                                              .ellipsis,
                                                          size: 10 * font,
                                                          weight:
                                                              FontWeight.w500,
                                                        ),
                                                        CommonText(
                                                          text: '05 minute ago',
                                                          maxLine: 2,
                                                          overFlow: TextOverflow
                                                              .ellipsis,
                                                          size: 10 * font,
                                                          weight:
                                                              FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10 * size,
                                          ),
                                        ],
                                      )
                                    : SizedBox();
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 0 * size,
                                );
                              },
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10 * size,
                        );
                      },
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}

Widget noNotification({double? size, double? font}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImage.noNotification,
          height: 158 * size!,
          width: 163 * size,
        ),
        SizedBox(
          height: 20 * size,
        ),
        CommonText(
          text: 'You have no notifications',
          size: 18 * font!,
          color: AppColor.mainColor,
        )
      ],
    ),
  );
}
