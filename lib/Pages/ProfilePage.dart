import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          upContainer(currentWidth, currentHeight),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DownContainer(),
            ],
          ),
          Positioned(
              left: Helper.dependOnWidth(140.04) * currentWidth + 10,
              top: Helper.dependOnHeight(99) * currentHeight,
              child: createProfileImage(currentHeight))
        ],
      ),

      // child: Container(
      // width: double.infinity,
      // height: double.infinity,
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     // SizedBox(
      //     //   height: Helper.dependOnHeight(99) * currentHeight,
      //     // ),
      //     // createProfileImage(currentHeight),
      //     // SizedBox(
      //     //   height: Helper.dependOnHeight(12) * currentHeight,
      //     // ),
      //     // createName(),
      //     // SizedBox(
      //     //   height: Helper.dependOnHeight(32) * currentHeight,
      //     // ),

      //     // ProfileitemRow(currentWidth, AppColors.callBlue, AppColors.white, "+90 5432305782", "Mobile Number", Icons.call),
      //     // ProfileitemRow(currentWidth, AppColors.mailGreen, AppColors.white, "ulvinomarov@mail.com", "Email", Icons.mail),
      //     // ProfileitemRow(currentWidth, AppColors.tarifOrange, AppColors.white, "+Tariffs", null, Icons.receipt),
      //     // ProfileitemRow(currentWidth, AppColors.settingsRed, AppColors.white, "+90 5432305782", null, Icons.settings),

      // ],
    ));
  }

  Widget upContainer(double currentWidth, double currentHeight) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.darkGreen,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12,24,0,0),
            child: SizedBox(
              height: Helper.dependOnWidth(44) * currentWidth,
              width: Helper.dependOnWidth(44) * currentWidth,
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(9)),
                  child: BackButton(
                    color: AppColors.lightGreen,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Text createName() {
    return Text(
      "Efe Can Tepe",
      style: TextStyle(
          color: AppColors.dotBlack, fontSize: 20, fontWeight: FontWeight.w500),
    );
  }

  Widget createProfileImage(double currentHeight) {
    return CircleAvatar(
      radius: Helper.dependOnWidth(104) * currentHeight / 4 + 3,
      backgroundColor: AppColors.white,
      child: CircleAvatar(
        radius: Helper.dependOnWidth(104) * currentHeight / 4,
        backgroundImage: AssetImage("assets/efe.png"),
      ),
    );
  }

  // Widget buildProfileImage() => CircleAvatar(

  //   radius: ,

  // )
}

class ProfileItemRow extends StatelessWidget {
  const ProfileItemRow({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.mainText,
    required this.secondaryText,
    required this.icon,
  });

  final Color backgroundColor;
  final Color iconColor;
  final String mainText;
  final String? secondaryText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    return Container(
      padding:
          EdgeInsets.fromLTRB(0, 0, 0, Helper.dependOnWidth(24) * currentWidth),
      child: Row(
        children: [
          SizedBox(
            width: Helper.dependOnWidth(20.75) * currentWidth,
          ),
          CircleAvatar(
            backgroundColor: backgroundColor,
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          SizedBox(
            width: Helper.dependOnWidth(16) * currentWidth,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              if (secondaryText != null)
                Text(
                  secondaryText ?? "",
                  style: TextStyle(
                      color: AppColors.unselectedTextGrey, fontSize: 12),
                ),
            ],
          )
        ],
      ),
    );
  }
}

class DownContainer extends StatelessWidget {
  const DownContainer({super.key});

  @override
  Widget build(BuildContext context) {
    void gotoSettings() {
      Navigator.pushNamed(context, "/settings");
    }

    final double currentHeight = MediaQuery.sizeOf(context).height;

    final double currentWidth = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: Helper.dependOnHeight(661 - 40) * currentHeight,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            SizedBox(
                height: Helper.dependOnWidth(104) * currentHeight / 4 + 12),
            Text(
              "Efe Can Tepe",
              style: TextStyle(
                  color: AppColors.dotBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Helper.dependOnHeight(32) * currentHeight,
            ),
            ProfileItemRow(
                backgroundColor: AppColors.callBlue,
                iconColor: AppColors.white,
                mainText: "+90 5432305782",
                secondaryText: "Mobile Number",
                icon: Icons.call),
            ProfileItemRow(
                backgroundColor: AppColors.mailGreen,
                iconColor: AppColors.white,
                mainText: "ulvinomarov@mail.com",
                secondaryText: "Email",
                icon: Icons.mail),
            ProfileItemRow(
                backgroundColor: AppColors.tarifOrange,
                iconColor: AppColors.white,
                mainText: "+Tariffs",
                secondaryText: null,
                icon: Icons.receipt),
            GestureDetector(
                onTap: gotoSettings,
                child: ProfileItemRow(
                    backgroundColor: AppColors.settingsRed,
                    iconColor: AppColors.white,
                    mainText: "Settings",
                    secondaryText: null,
                    icon: Icons.settings)),
          ],
        ),
      ),
    );
  }
}
