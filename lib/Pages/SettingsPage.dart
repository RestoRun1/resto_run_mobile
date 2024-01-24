import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/helper.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
        body: SafeArea(
      child: Container(
        color: AppColors.darkGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Helper.dependOnWidth(20) * currentWidth,
                        ),
                        SizedBox(
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
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Helper.dependOnWidth(20) * currentWidth,
                        ),
                        Text(
                          "Settings",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )),
            SizedBox(
              height: Helper.dependOnHeight(637) * currentHeight,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                    
                child:Column(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  
                  children: [

                    const Padding(
                      padding: const EdgeInsets.fromLTRB(0, 28, 33.25, 0),
                      child: Column(
                        
                        children: [
                          
                          SettingsRow(
                            backgroundColor: AppColors.callBlue, 
                            iconColor: AppColors.white, 
                            mainText: "Face Id", 
                            secondaryText: null, 
                            icon: Icons.face
                          ),

                          SettingsRow(
                            backgroundColor: AppColors.tarifOrange, 
                            iconColor: AppColors.white, 
                            mainText: "Push Notifications", 
                            secondaryText: null, 
                            icon: Icons.notifications
                          ),

                          SettingsRow(
                            backgroundColor: AppColors.notificationPurple, 
                            iconColor: AppColors.white, 
                            mainText: "Apperance", 
                            secondaryText: null, 
                            icon: Icons.sunny
                          ),

                          SettingsRow(
                            backgroundColor: AppColors.tarifOrange, 
                            iconColor: AppColors.white, 
                            mainText: "Email Updates", 
                            secondaryText: null, 
                            icon: Icons.email
                          )
                        ],
                      )
                    ),

                    const Spacer(), // NEVER REMOVE IT  

                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.notificationGreen,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                    
                        mainAxisAlignment: MainAxisAlignment.center,
                    
                        children: [
                          SizedBox(
                            height:
                                Helper.dependOnHeight(25.76) * currentHeight,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Appearance",
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 16),
                              )),
                          SizedBox(
                            height:
                                Helper.dependOnHeight(15) * currentHeight,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () => {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(
                                            Helper.dependOnWidth(10) *
                                                currentWidth,
                                            0,
                                            Helper.dependOnWidth(10) *
                                                currentWidth,
                                            0)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star_outline,
                                        color: AppColors.black,
                                      ),
                                      Text(
                                        "System",
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ),
                                    ],
                                  )),
                              ElevatedButton(
                                  onPressed: () => {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(
                                            Helper.dependOnWidth(10) *
                                                currentWidth,
                                            0,
                                            Helper.dependOnWidth(10) *
                                                currentWidth,
                                            0)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.wb_sunny_outlined,
                                        color: AppColors.black,
                                      ),
                                      SizedBox(
                                        width: Helper.dependOnWidth(8) *
                                            currentWidth,
                                      ),
                                      Text(
                                        "Light",
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ),
                                    ],
                                  )),
                              ElevatedButton(
                                  onPressed: () => {},
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(
                                            Helper.dependOnWidth(10) *
                                                currentWidth,
                                            0,
                                            Helper.dependOnWidth(10) *
                                                currentWidth,
                                            0)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.dark_mode),
                                      Text(
                                        "Dark",
                                        style:
                                            TextStyle(color: AppColors.black),
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                          ],
                        ),

                        SizedBox(height: 10,)
                      ],
                    ),
                                        )
                ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class SettingsRow extends StatelessWidget {
  const SettingsRow({
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
          ),

          const Spacer(),
          Switch(value: false, onChanged: (bool value) => print(value))
        ],
      ),
    );
  }
}
