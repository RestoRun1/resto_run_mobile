import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';

class HorizontalListViewButton extends StatefulWidget {
  HorizontalListViewButton({super.key});

  _HorizontalListViewButton createState() => _HorizontalListViewButton();
}

class _HorizontalListViewButton extends State<HorizontalListViewButton> {
  int selectedOption = 0;
  int selectedButtonIndex = 0;

  void handleButtonPress(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tags = ["All Nearby", "Asian", "Italian", "Turkish"];

    return Container(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 75,
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: selectedButtonIndex == index ? AppColors.lightRed: AppColors.white,
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 25,
                margin: EdgeInsets.all(10),
                child: Center(
                  child: TextButton(
                    child: Text(
                      tags[index],
                      style: TextStyle(
                          color: index == selectedButtonIndex
                              ? AppColors.white
                              : AppColors.dotBlack),
                    ),
                    onPressed: () {
                      handleButtonPress(index);
                    },
                  ),
                ),
              ),
              itemCount: tags.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      )),
    );
  }
}
