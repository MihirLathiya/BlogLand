import 'dart:developer';

import 'package:get/get.dart';

class NotificationController extends GetxController {
  Map<String, dynamic> notification = {
    "message": [
      {
        "_id": "63a6da156054237622981888",
        "title": "Jio",
        "body": "Nice",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-28",
        "updatedAt": "2022-12-28"
      },
      {
        "_id": "63a5c32960542376229808bb",
        "title": "Reliance",
        "body": "Hello",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-28",
        "updatedAt": "2022-12-28"
      },
      {
        "_id": "63a5c31360542376229808a3",
        "title": "HEllo Reliance",
        "body": "Stock down",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-27",
        "updatedAt": "2022-12-27"
      },
      {
        "_id": "63a5bece60542376229807fe",
        "title": "Hello",
        "body": "Hello",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-23",
        "updatedAt": "2022-12-23"
      },
      {
        "_id": "63a5b7af605423762298077f",
        "title": "Hello Test",
        "body": "Hello Every one",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-23",
        "updatedAt": "2022-12-23"
      },
      {
        "_id": "63a49d5badbf1ad5f262e1a3",
        "title": "movers reliance sec title",
        "body": "movers reliance sec description",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-22",
        "updatedAt": "2022-12-22"
      },
      {
        "_id": "63a49a44adbf1ad5f262e18c",
        "title": "second tesla title",
        "body": "second tesla description",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-22",
        "updatedAt": "2022-12-22"
      },
      {
        "_id": "63a2fa4d34ac8e943aee619b",
        "title": "IDFC Bank",
        "body":
            "Financials will continue to do well. Today was a day of panic and sell off was knee jerk reaction. Things will settle down and idfc first will bounce back",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-21",
        "updatedAt": "2022-12-21"
      },
      {
        "_id": "63a2fa0b34ac8e943aee618e",
        "title": "IDFC Bank",
        "body":
            "Financials will continue to do well. Today was a day of panic and sell off was knee jerk reaction. Things will settle down and idfc first will bounce back",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-21",
        "updatedAt": "2022-12-21"
      },
      {
        "_id": "63a2e0d034ac8e943aee6100",
        "title": "Power Grid Corporation",
        "body":
            "The objective of Power Grid Corporation of India Ltd is to create a strong and vibrant national grid in the country to ensure the optimum utilization of generating resources",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-21",
        "updatedAt": "2022-12-21"
      },
      {
        "_id": "63a2dffb34ac8e943aee60ef",
        "title": "Larsen & Toubro Ltd. Announcments",
        "body":
            "Larsen & Toubro - Announcement under Regulation 30 (LODR)-Press Release / Media Release ",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-21",
        "updatedAt": "2022-12-21"
      },
      {
        "_id": "63a04a2234ac8e943aee520b",
        "title": "second tesla title",
        "body": "second tesla description",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-19",
        "updatedAt": "2022-12-19"
      },
      {
        "_id": "63a00f3234ac8e943aee4fcc",
        "title": "second tesla title",
        "body": "second tesla description",
        "userId": "63957685ebd6c837509e0bdc",
        "createdAt": "2022-12-19",
        "updatedAt": "2022-12-19"
      }
    ]
  };

  List? showDate = [];

  filterData() {
    notification['message'].forEach(
      (element) {
        if (showDate!.contains(element['createdAt'])) {
        } else {
          showDate!.add(element['createdAt']);
        }
      },
    );
  }

  removeData(int index, index1) {
    (notification['message'] as List).removeAt(index);

    log('NOTIFICATION :- ${notification}');
    update();
  }
}
