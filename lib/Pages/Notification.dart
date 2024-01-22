import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/images.dart';
import "../helper.dart";

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
 

  @override
  Widget build(BuildContext context) {

    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    return Container(
      
      color: AppColors.darkGreen,

      child: Column(
        children: <Widget>[
          SizedBox(
            height: Helper.dependOnHeight(216) * currentHeight,
            child: Container(
              color: AppColors.darkGreen,
            ),
          ),
          Expanded(
            child: Container(

              height: double.infinity,
              width: double.infinity,

              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),

              child: NotificationPanel(),

            ),
      
          )
        ],
      ),
    );
  }
}

class NotificationPanel extends StatelessWidget {
  const NotificationPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return Container(

      padding: EdgeInsets.fromLTRB(20.75, 20, 20.75, 0),

      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget> [
      
          Text("New", style: TextStyle(

            color: AppColors.lightGreen,
            fontWeight: FontWeight.bold

          ),),

          SizedBox(height: Helper.dependOnHeight(16) * currentHeight ,),

          Row(
            children: [
              Container(
                
                height: currentHeight * Helper.dependOnHeight(40),
                width: currentHeight * Helper.dependOnHeight(40),

                child: SvgPicture.asset("assets/dominosTest.svg")
                
              )
            ],

          )


        ],
      
      ),
    );
  }
}
