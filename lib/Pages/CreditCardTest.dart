import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Cards extends StatelessWidget {
  Cards({super.key});

  String cardHolderName = "Efe Can Tepe";
  String cardNumber = "4445 2901 0604 3021";
  String expiryDate = "10/24";
  String cvvCode = "431";
  bool showBackView = false;

  List<Map<String, Object>> cardList = [
    {
      "cardHolderName": "Efe Can Tepe",
      "cardNumber": "4445 2901 0604 3021",
      "expiryDate": "10/24",
      "cvvCode": "431",
      "showBackView": false
    },
    {
      "cardHolderName": "Efe Can Tepe",
      "cardNumber": "4445 2901 0604 3021",
      "expiryDate": "10/24",
      "cvvCode": "431",
      "showBackView": false
    },
    {
      "cardHolderName": "Efe Can Tepe",
      "cardNumber": "4445 2901 0604 3021",
      "expiryDate": "10/24",
      "cvvCode": "431",
      "showBackView": false
    },
    {
      "cardHolderName": "Efe Can Tepe",
      "cardNumber": "4445 2901 0604 3021",
      "expiryDate": "10/24",
      "cvvCode": "431",
      "showBackView": false
    },
    {
      "cardHolderName": "Efe Can Tepe",
      "cardNumber": "4445 2901 0604 3021",
      "expiryDate": "10/24",
      "cvvCode": "431",
      "showBackView": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: cardList.length,
        itemBuilder: ((context, index, realIndex) {
          return CardInstance(
            cardNumber: cardList[index]["cardNumber"] as String,
            expiryDate: cardList[index]["expiryDate"] as String,
            cardHolderName: cardList[index]["cardHolderName"] as String,
            cvvCode: cardList[index]["cvvCode"] as String,
            showBackView: cardList[index]["showBackView"] as bool,
          );
        }),
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          viewportFraction: 0.85
        ));
  }
}

class CardInstance extends StatelessWidget {
  const CardInstance({
    super.key,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.showBackView,
  });

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool showBackView;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 500,
      child: CreditCardWidget(
          height: 400,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (CreditCardBrand cardBrand) {}),
    );
  }
}
