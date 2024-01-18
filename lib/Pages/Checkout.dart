import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Pages/YourCart.dart';
import 'package:sizer/sizer.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _Checkout();
}

class _Checkout extends State<Checkout> {
  void swithcMyCards() {
    print("Switch To My Card Panel");
  }

  void switchNewCards() {
    print("Switch To New Card Panel");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(), 
        CardButtons(switchMyCards: swithcMyCards, switchNewCards: switchNewCards,),
        Column(

        
          children: [

            Text("Card Number")

          ],
        )


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
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
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
          ElevatedButton(
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
        ],
      ),
    );
  }
}
