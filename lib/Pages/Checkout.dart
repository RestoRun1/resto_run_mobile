import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Pages/CreditCardTest.dart';
import 'package:resto_run_mobile/Pages/YourCart.dart';
import 'package:resto_run_mobile/helper.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _Checkout();
}

class _Checkout extends State<Checkout> {
  final int INPUT_SELECTED = 0;
  final int CARD_SELECTED = 1;

  int selection = 0;

  void payOrder() {
    Navigator.pushNamed(context, '/paymentSuccess');
  }

  void swithcMyCards() {
    setState(() {
      selection = CARD_SELECTED;
    });
  }

  void switchNewCards() {
    setState(() {
      selection = INPUT_SELECTED;
    });
  }

  @override
  Widget build(BuildContext context) {

    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(

      appBar: AppBar(
        leading: SizedBox(
          width: Helper.dependOnWidth(45) * currentWidth  ,

          child: Container(

            decoration: const BoxDecoration(

              color: AppColors.backgroundLightWhite

            ),

            child: const BackButton(
              color: AppColors.darkBlueBackButtn  
              
            ),
          ),

        ),

      ),


      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: false,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: MainBody(),
            )
          ],
        ),
      ),
    );
  }

  Widget MainBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          TitleRow(),
          CardButtons(
            switchMyCards: swithcMyCards,
            switchNewCards: switchNewCards,
          ),
          const SizedBox(
            height: 10,
            width: double.infinity,
          ),
          IndexedStack(
            alignment: Alignment.topCenter,
            index: selection,
            children: [
              CardInputSections(), // Index 0
              aCard()
            ],
          ),
          Text("We will send you an order details to your"),
          Text("email after the succesfull payment"),
          PayButton(),
        ],
      ),
    );
  }

  Widget InputCreditCard() {
    if (selection == INPUT_SELECTED) {
      return CardInputSections();
    }

    String cardHolderName = "Efe Can Tepe";
    String cardNumber = "4445 2901 0604 3021";
    String expiryDate = "10/24";
    String cvvCode = "431";
    bool showBackView = false;

    // void onCreditCardWidgetChange(CreditCardModel creditCardModel){
    //   setState(() {
    //     cardNumber = cardNumber;
    //     expiryDate = expiryDate;
    //     cardHolderName = cardHolderName;
    //     cvvCode = cvvCode;
    //     showBackView = showBackView;
    //   });
    // }

    // CreditCardWidget creditCardWidget = CreditCardWidget(
    //     cardNumber: cardNumber,
    //     expiryDate: expiryDate,
    //     cardHolderName: cardHolderName,
    //     cvvCode: cvvCode,
    //     showBackView: showBackView,
    //     onCreditCardWidgetChange: (CreditCardModel creditCardModel){}
    //   );

    // return Expanded(
    //   child: CreditCardWidget(
    //     cardNumber: cardNumber,
    //     expiryDate: expiryDate,
    //     cardHolderName: cardHolderName,
    //     cvvCode: cvvCode,
    //     showBackView: showBackView,
    //     onCreditCardWidgetChange:(CreditCardBrand cardBrand) {}
    //   ),
    // );

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: AppColors.lightRed,
      ),
    ));
  }

  Widget PayButton() {
    return Flexible(
      flex: 1,
      child: ElevatedButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(AppColors.lightGreen),
            foregroundColor: MaterialStateProperty.all(AppColors.white),
          ),
          onPressed: payOrder,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock),
              const SizedBox(
                width: 10,
              ),
              Text("Pay for the order")
            ],
          )),
    );
  }
}

class CardInputSections extends StatelessWidget {
  const CardInputSections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Card Number",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.backgroundPurple,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: 'Enter Credit Card',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "Cardholder Name",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey),
            ),
          ],
        ),
        Container(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.backgroundPurple,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              labelText: 'Name',
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expiry Date',
                      style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  // Add some spacing between title and TextField
                  TextField(
                    // Your first TextField properties go here
                    decoration: InputDecoration(
                      hintText: "MM / YYYY",
                      filled: true,
                      fillColor: AppColors.backgroundPurple,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0), // Add some spacing between the columns
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CVV / CVC',
                      style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  TextField(
                    // Your second TextField properties go here
                    decoration: InputDecoration(
                      hintText: "_ _ _ ",
                      filled: true,
                      fillColor: AppColors.backgroundPurple,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class TitleRow extends StatefulWidget {
  const TitleRow({
    super.key,
  });

  @override
  State<TitleRow> createState() => _TitleRowState();
}

class _TitleRowState extends State<TitleRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Checkout",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.credit_card),
          ],
        ),
        Column(
          children: [
            Text(
              "₹ 1,527",
              style: TextStyle(
                  color: AppColors.lightGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Including GST (18%)",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey),
            ),
          ],
        )
      ],
    );
  }
}

class CardButtons extends StatefulWidget {
  Function switchNewCards;
  Function switchMyCards;

  CardButtons(
      {super.key, required this.switchMyCards, required this.switchNewCards});

  @override
  State<CardButtons> createState() => _CardButtonsState();
}

class _CardButtonsState extends State<CardButtons> {
  final int NEW_CARDS_SELECTED = 0;
  final int MY_CARDS_SELECTED = 1;

  int cardChoice = 0;

  void handleNewCardTap() {
    setState(() {
      cardChoice = NEW_CARDS_SELECTED;
    });

    widget.switchNewCards();

    print("Handle New Card is clicked");
  }

  void handleMyCardsTaps() {
    setState(() {
      cardChoice = MY_CARDS_SELECTED;
    });

    widget.switchMyCards();
    print("My Card is clicked");
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        cardChoice == NEW_CARDS_SELECTED
                            ? AppColors.lightGreen
                            : AppColors.productBackColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ))),
                onPressed: () => handleNewCardTap(),
                child: Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: cardChoice == NEW_CARDS_SELECTED
                          ? AppColors.white
                          : AppColors.textGrey,
                    ),
                    Text(
                      "New Cards",
                      style: TextStyle(
                          color: cardChoice == NEW_CARDS_SELECTED
                              ? AppColors.white
                              : AppColors.textGrey),
                    )
                  ],
                )),
          ),
          Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        cardChoice == MY_CARDS_SELECTED
                            ? AppColors.lightGreen
                            : AppColors.productBackColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ))),
                onPressed: () => handleMyCardsTaps(),
                child: Text(
                  "My Cards",
                  style: TextStyle(
                      color: cardChoice == MY_CARDS_SELECTED
                          ? AppColors.white
                          : AppColors.textGrey),
                )),
          ),
        ],
      ),
    );
  }
}
