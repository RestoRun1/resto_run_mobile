import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/images.dart';
import "../helper.dart";

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  String? title;
  String? image;
  String? description;
  int index = 0;

  void handleRowClick(String title, String image, String description) {
    setState(() {
      this.title = title;
      this.description = description;
      this.image = image;
      this.index = 1;
    });
  }

  void goBackNotificationPanel() {
    setState(() {
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    return Container(
      color: AppColors.darkGreen,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onDoubleTap: () {
              goBackNotificationPanel();
            },
            child: SizedBox(
              height: Helper.dependOnHeight(216) * currentHeight,
              child: Container(
                color: AppColors.darkGreen,
              ),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: index,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: NotificationPanel(handleRowClick: handleRowClick),
                ),
                NotificationExplanation(
                    title: title ?? "",
                    image: image ?? "",
                    description: description ?? ""),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NotificationExplanation extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const NotificationExplanation(
      {super.key,
      required this.title,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.notificationGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20.75, 20, 20.75, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppColors.white, fontSize: 24),
              ),
              SizedBox(
                height: Helper.dependOnHeight(20) *
                    MediaQuery.sizeOf(context).height,
              ),
              SizedBox(
                width: Helper.dependOnWidth(335) *
                    MediaQuery.sizeOf(context).width,
                child: Image.asset(image),
              ),
              SizedBox(
                height: Helper.dependOnHeight(20) *
                    MediaQuery.sizeOf(context).height,
              ),
              Text(
                description,
                style: const TextStyle(color: AppColors.white, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationPanel extends StatelessWidget {
  Function(String, String, String) handleRowClick;

  NotificationPanel({super.key, required this.handleRowClick});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newNotification = [
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Bibendum sit eu morbi velit praesent. Fermentum mauris fringilla vitae feugiat vel sit blandit quam. In mi sodales nisl eleifend duis porttitor. "
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week",
        "description": "Fenerbahce Fenerbahce Fenerbahce"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week",
        "description": "Efe Can Tepe askljdsa lkdjasldk"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week",
        "description": "Hasan Hasan Hasan asdjkhasdkjahsduihe jklshd aueih r"
      },
    ];

    final List<Map<String, String>> oldNotification = [
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Bibendum sit eu morbi velit praesent. Fermentum mauris fringilla vitae feugiat vel sit blandit quam. In mi sodales nisl eleifend duis porttitor. "
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week",
        "description": "Fenerbahce Fenerbahce Fenerbahce"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week",
        "description": "Efe Can Tepe askljdsa lkdjasldk"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week",
        "description": "Hasan Hasan Hasan asdjkhasdkjahsduihe jklshd aueih r"
      },
    ];

    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.75, 20, 20.75, 0),
        child: CreateNotificationPanel(
            currentHeight, newNotification, oldNotification),
      ),
    );
  }

  Column CreateNotificationPanel(
      double currentHeight,
      List<Map<String, String>> newNotification,
      List<Map<String, String>> oldNotification) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "New",
          style: TextStyle(
              color: AppColors.lightGreen, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Helper.dependOnHeight(16) * currentHeight,
        ),
        Column(
          children: [
            for (int index = 0; index < newNotification.length; index++)
              Column(
                children: [
                  SingleNotificationLine(
                    mainText: newNotification[index]['mainText'] ?? " ",
                    secondaryText:
                        newNotification[index]['secondaryText'] ?? "",
                    logoLocation: newNotification[index]['logo'] ?? "",
                    description: newNotification[index]['description'] ?? "",
                    handleRowClick: handleRowClick,
                  ),
                  index != newNotification.length - 1
                      ? SizedBox(
                          height: Helper.dependOnHeight(16) * currentHeight,
                        )
                      : const SizedBox()
                ],
              )
          ],
        ),
        SizedBox(
          height: Helper.dependOnHeight(20) * currentHeight,
        ),
        const Text(
          "Old",
          style: TextStyle(
              color: AppColors.lightGreen, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Helper.dependOnHeight(16) * currentHeight,
        ),
        Column(
          children: [
            for (int index = 0; index < oldNotification.length; index++)
              Column(
                children: [
                  SingleNotificationLine(
                    mainText: oldNotification[index]['mainText'] ?? " ",
                    secondaryText:
                        oldNotification[index]['secondaryText'] ?? "",
                    logoLocation: oldNotification[index]['logo'] ?? "",
                    description: oldNotification[index]['description'] ?? "",
                    handleRowClick: handleRowClick,
                  ),
                  index != oldNotification.length - 1
                      ? SizedBox(
                          height: Helper.dependOnHeight(16) * currentHeight,
                        )
                      : const SizedBox()
                ],
              )
          ],
        ),
        SizedBox(
          height: Helper.dependOnHeight(20) * currentHeight,
        ),
      ],
    );
  }
}

class SingleNotificationLine extends StatelessWidget {
  final String mainText;
  final String secondaryText;
  final String logoLocation;
  final String description;
  final Function(String, String, String) handleRowClick;

  const SingleNotificationLine(
      {super.key,
      required this.mainText,
      required this.secondaryText,
      required this.logoLocation,
      required this.handleRowClick,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        handleRowClick(mainText, "assets/explanation.jpeg", description);
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: currentWidth * Helper.dependOnWidth(40) / 2 + 1,
            backgroundColor: AppColors.lightGreen,
            child: CircleAvatar(
                radius: currentWidth * Helper.dependOnWidth(40) / 2,
                backgroundColor: AppColors.backgroundLightWhite,
                child: SvgPicture.asset(
                  logoLocation,
                )),
          ),
          SizedBox(
            width: currentWidth * Helper.dependOnWidth(12),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                secondaryText,
                style: TextStyle(color: AppColors.lightGreen, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
