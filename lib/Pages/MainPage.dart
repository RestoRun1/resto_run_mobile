import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Components/HomeCarouselSlider.dart';
import 'package:resto_run_mobile/Components/HomeSearchBar.dart';
import "package:carousel_slider/carousel_slider.dart";
import 'package:resto_run_mobile/Components/HorizontalListViewButton.dart';
import 'package:resto_run_mobile/Components/RestaurantGridLayout.dart';
import 'package:resto_run_mobile/Components/SideBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  // ignore: empty_constructor_bodies
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(

          preferredSize: Size.fromHeight(50),

          child: AppBar(
          
            leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(Icons.menu, color: AppColors.white,)),
            backgroundColor: AppColors.darkGreen,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(onPressed: () => print("Search") ,icon: Icon(Icons.search, color: AppColors.white,)),
                    SizedBox(width: 10,),
                    CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("assets/efe.png")),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: SideBar(),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.3,
                0
              ],
                  colors: [
                AppColors.darkGreen,
                AppColors.backgroundLightWhite
              ])),
          //height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 ),
                  child: HomeSearchBar(),
                ),
                SizedBox(height: 25),
                Container(
                  height: 100,
                  width: 300,
                  color: AppColors.lightRed,
                ),
                SizedBox(height: 5,),
                HorizontalListViewButton(),
                
                SizedBox(height: 10,),
                Expanded(child: RestaurantGridLayout(),) 
               
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
