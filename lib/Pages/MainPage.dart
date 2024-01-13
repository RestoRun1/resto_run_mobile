import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';

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
        body: const SafeArea(child: Center(child: Text("Hello World"))),
        bottomNavigationBar: BottomNavigationBar(
          
          showSelectedLabels: false,
          showUnselectedLabels: false,

          onTap: (index) => setState(() => currentIndex = index),
          selectedIconTheme: const IconThemeData(
            color: AppColors.lightGreen
          ),

          unselectedIconTheme: const IconThemeData(
            color: AppColors.unselectedNavItem
          ),  

          selectedLabelStyle: const TextStyle(
            color: AppColors.lightGreen,
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),

          unselectedLabelStyle: const TextStyle(
            color: AppColors.unselectedNavItem,
            fontSize: 10,
            fontWeight: FontWeight.bold
          ),

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
            
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code), 
              label: "QR"
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shop), 
              label: "Shop"
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), 
                label: "Notification"
            ),
          ],
        ),
      );
}
