import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/secure_storage.dart';
import 'package:resto_run_mobile/user.dart';

class SideBar extends StatelessWidget {

  SecureStorage storage = SecureStorage();
  User user = User();

  @override
  Widget build(BuildContext context) {
    String getToday() {
      DateTime today = new DateTime.now();

      String formatedDate = DateFormat("d MMMM yyyy").format(today);

      return formatedDate;
    }

    return Drawer(
      backgroundColor: AppColors.lightGreen,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Icon(Icons.fork_left),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Welcome ${user.username}",
                style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/profilePage'),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(color: AppColors.white),
                          )
                        ],
                      )),
                  TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/map'),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.map,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Map",
                            style: TextStyle(color: AppColors.white),
                          )
                        ],
                      )),
                  TextButton(
                      onPressed: () => print("Sidebar Payment"),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.payment,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Payment",
                            style: TextStyle(color: AppColors.white),
                          )
                        ],
                      )),
                  TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/orderTracking"),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.ads_click,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Order Status",
                            style: TextStyle(color: AppColors.white),
                          )
                        ],
                      )),
                ],
              ),
              const Spacer(),

              TextButton(
                  onPressed: () => print("Contact Us"),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.contact_page,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Contact Us",
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  )
                ),

              TextButton(
                  onPressed: () => Navigator.pushNamed(context, "/faq"),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.question_answer,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "FAQ",
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  )
                ),


              TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signIn'),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Log Out",
                        style: TextStyle(color: AppColors.white),
                      )
                    ],
                  )
                ),

              const SizedBox(height: 30,),
                
              const Text(
                "Version 1.0",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                getToday(),
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
