import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Components/HomeCarouselSlider.dart';
import 'package:resto_run_mobile/Components/HomeSearchBar.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:resto_run_mobile/Components/HorizontalListViewButton.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  // ignore: empty_constructor_bodies
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4, 0],
              colors: [AppColors.darkGreen, AppColors.backgroundLightWhite]
            )

          ),
          //height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SafeArea(
                      child: Row(
                        children: [
                          Icon(
                            Icons.menu,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [Text("a"), Text("b")],
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage("assets/images/efe.png")
                          ),

                          //Image.asset('assets/images/efe.png',)
                        ],
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        child: HomeSearchBar(),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),

                    SizedBox(height: 25),

                    Container(
                      height: 100,
                      width: 300,
                      color: AppColors.lightRed,
                    ),

                    SafeArea(child: 
                      HorizontalListViewButton()
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => setState(() => currentIndex = index),
          selectedIconTheme: const IconThemeData(color: AppColors.lightGreen),
          unselectedIconTheme:
              const IconThemeData(color: AppColors.unselectedNavItem),
          selectedLabelStyle: const TextStyle(
              color: AppColors.lightGreen,
              fontSize: 14,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(
              color: AppColors.unselectedNavItem,
              fontSize: 10,
              fontWeight: FontWeight.bold),
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourite",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "QR"),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notification"),
          ],
        ),
      );
}
