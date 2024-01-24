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
        child: Container(

            decoration: BoxDecoration(

              gradient: LinearGradient(

                colors : [AppColors.darkGreen, AppColors.white],
                stops: [0.2, 0.0],
                begin: Alignment.topCenter,
                end : Alignment.bottomCenter

              ),

              

            ),

            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Helper.dependOnHeight(99) * currentHeight,
                ),
                CircleAvatar(
                  radius: Helper.dependOnWidth(104) * currentHeight / 4,
                  backgroundImage: AssetImage("assets/efe.png"),
                ),
                SizedBox(
                  height: Helper.dependOnHeight(12) * currentHeight,
                ),
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

                ProfileitemRow(currentWidth, AppColors.callBlue, AppColors.white, "+90 5432305782", "Mobile Number", Icons.call),
                ProfileitemRow(currentWidth, AppColors.mailGreen, AppColors.white, "ulvinomarov@mail.com", "Email", Icons.mail),
                ProfileitemRow(currentWidth, AppColors.tarifOrange, AppColors.white, "+Tariffs", null, Icons.receipt),
                ProfileitemRow(currentWidth, AppColors.settingsRed, AppColors.white, "+90 5432305782", null, Icons.settings),
              
              
              ],
            )),
      ),
    );
  }

  Widget ProfileitemRow(double currentWidth, Color backgroundColor,
    Color iconColor, String mainText, String? secondaryText, IconData icon) {
  return Container(

    
    padding: EdgeInsets.fromLTRB(0, 0, 0, Helper.dependOnWidth(24) * currentWidth ),

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
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            if (secondaryText != null)
              Text(
                secondaryText,
                style:
                    TextStyle(color: AppColors.unselectedTextGrey, fontSize: 12),
              ),
          ],
        )
      ],
    ),
  );
}


  // Widget buildProfileImage() => CircleAvatar(

  //   radius: ,

  // )
}
