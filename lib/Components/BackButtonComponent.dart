import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/helper.dart';

class BackButtonComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return SizedBox(
        width: Helper.dependOnWidth(45) * currentWidth,
        child: Container(
          decoration: const BoxDecoration(color: AppColors.backgroundLightWhite),
          child: const BackButton(color: AppColors.lightGreen),
        ),
      );
  }
}
