import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:resto_run_mobile/Components/RestaurantGridLayout.dart';
import 'package:resto_run_mobile/Pages/Checkout.dart';
import 'package:resto_run_mobile/Pages/CreditCardTest.dart';
import 'package:resto_run_mobile/Pages/FAQ.dart';
import 'package:resto_run_mobile/Pages/MainPage.dart';
import 'package:resto_run_mobile/Pages/MapPage.dart';
import 'package:resto_run_mobile/Pages/Notification.dart';
import 'package:resto_run_mobile/Pages/OrderTrackingPage.dart';
import 'package:resto_run_mobile/Pages/PaymentSuccessPage.dart';
import 'package:resto_run_mobile/Pages/ProfilePage.dart';
import 'package:resto_run_mobile/Pages/Scanner.dart';
import 'package:resto_run_mobile/Pages/SettingsPage.dart';
import 'package:resto_run_mobile/Pages/SignUp.dart';
import 'package:resto_run_mobile/Pages/YourCart.dart';
import 'package:resto_run_mobile/secure_storage.dart';
import 'Pages/SignIn.dart';
import 'Pages/MakeReservation.dart';
import 'Pages/ReviewInformationPage.dart';
import 'Pages/Notification.dart';
import 'Pages/MyReservations.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(), //Scaffold(body: SafeArea(child: NotificationPage(),)),
      routes: {
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/mainPage': (context) => const MainPage(),
        '/reservation': (context) => MakeReservation(),
        '/reservationReview': (context) => ReviewInformationPage(),
        '/GridLayoutTest': (context) => const RestaurantGridLayout(),
        '/yourCart': (context) => const YourCart(),
        '/checkout': (context) => const Checkout(),
        '/paymentSuccess': (context) => const PaymentSuccessPage(),
        '/orderTracking': (context) => const OrderTrackingPage(),
        '/notification': (context) => const NotificationPage(),
        '/profilePage': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/scanner': (context) => Scanner(),
        '/faq': (context) => FAQ(),
        '/map': (context) => const MapPage(),
        '/myReservations': (context) => MyReservations()
      },
    );
  }
}
