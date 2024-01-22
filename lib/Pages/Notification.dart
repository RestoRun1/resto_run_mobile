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
  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    return Container(
      color: AppColors.darkGreen,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: Helper.dependOnHeight(216) * currentHeight,
            child: Container(
              color: AppColors.darkGreen,
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: NotificationPanel(),
            ),
          )
        ],
      ),
    );
  }
}

class NotificationPanel extends StatelessWidget {
  const NotificationPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newNotification = [
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },
    ];

    final List<Map<String, String>> oldNotification = [
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },
      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },

      {
        "logo": "assets/dominosTest.svg",
        "mainText": "Bonus Week - 20",
        "secondaryText": "Discount Valid For Current Week"
      },

    ];

    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20.75, 20, 20.75, 0),
        child: CreateNotificationPanel(currentHeight, newNotification, oldNotification),
      ),
    );
  }

  Column CreateNotificationPanel(double currentHeight, List<Map<String, String>> newNotification, List<Map<String, String>> oldNotification) {
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

            for(int index = 0 ; index < newNotification.length; index++)
              Column(
                  children: [
                    SingleNotificationLine(
                        mainText: newNotification[index]['mainText'] ?? " ",
                        secondaryText: newNotification[index]['secondaryText'] ?? "",
                        logoLocation: newNotification[index]['logo'] ?? ""
                    ),

                    index != newNotification.length - 1 ? SizedBox(height: Helper.dependOnHeight(16) * currentHeight,) : const SizedBox()

                  ],
                )
            ],
          ),
           
          SizedBox(height: Helper.dependOnHeight(20) * currentHeight,),

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

            for(int index = 0 ; index < oldNotification.length; index++)
              Column(
                  children: [
                    SingleNotificationLine(
                        mainText: oldNotification[index]['mainText'] ?? " ",
                        secondaryText: oldNotification[index]['secondaryText'] ?? "",
                        logoLocation: oldNotification[index]['logo'] ?? ""
                    ),
                    index != oldNotification.length - 1 ? SizedBox(height: Helper.dependOnHeight(16) * currentHeight,) : const SizedBox()
                  ],
                )
            ],
          ),

          SizedBox(height: Helper.dependOnHeight(20) * currentHeight,),

        ],
      );
  }
}

class SingleNotificationLine extends StatelessWidget {
  final String mainText;
  final String secondaryText;
  final String logoLocation;

  const SingleNotificationLine(
      {super.key,
      required this.mainText,
      required this.secondaryText,
      required this.logoLocation});

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return GestureDetector(

      onPanUpdate: (details) => {

        if(details.delta.dx > 0){
          print("Right Swiped")
        }

      },

      child: Row(
        children: [
          CircleAvatar(
            radius: currentWidth * Helper.dependOnWidth(40) / 2 + 1,
            backgroundColor: AppColors.lightGreen,
            child: CircleAvatar(
                radius: currentWidth * Helper.dependOnWidth(40) / 2,
                backgroundColor: AppColors.white,
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
