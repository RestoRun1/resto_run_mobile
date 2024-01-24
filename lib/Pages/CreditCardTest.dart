
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class aCard extends StatelessWidget{

  aCard({super.key});

  String cardHolderName = "Efe Can Tepe";
  String cardNumber = "4445 2901 0604 3021";
  String expiryDate = "10/24";
  String cvvCode = "431";
  bool showBackView = false;

  @override
  Widget build(BuildContext context){
    return Column(
      
      children: [
        SizedBox(height: 30,),

        SizedBox(
        
          height: 200,
          width: 500,
        
          child: CreditCardWidget(
            height: 400 ,
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            showBackView: showBackView, 
            onCreditCardWidgetChange:(CreditCardBrand cardBrand) {}  
          ),
        ),

        SizedBox(height: 20,),
  
      ],
    );
  }
  
}
