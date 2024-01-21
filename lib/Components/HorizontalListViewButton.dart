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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12 / 389 * MediaQuery.sizeOf(context).width),
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height : 57 / 812 * MediaQuery.sizeOf(context).height ,
            child: ListView.builder(
              itemBuilder: (context, index) => SizedBox(
      
                height: 38 / 812 * MediaQuery.sizeOf(context).height ,
                width: 107 / 389 * MediaQuery.sizeOf(context).width, 
      
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedButtonIndex == index ? AppColors.lightRed: AppColors.white,
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.fromLTRB(0,0,8 / 389 * MediaQuery.sizeOf(context).width,0),
                  child: TextButton(
                    child: Text(
                      tags[index],
                      style: TextStyle(
                          fontSize: 11,
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
