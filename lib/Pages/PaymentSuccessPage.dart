import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    final double currentHeight = MediaQuery.of(context).size.width;

    final double logoHeightFromTop = currentHeight * 220 / 812;
    final double a = 91 / 389 * currentWidth;

    return (Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: logoHeightFromTop,
              ),
              Row(
                children: [
                  SizedBox(
                    width: a,
                  ),
                  SvgPicture.asset('assets/paymentSuccess.svg'),
                ],
              ),
              SizedBox(
                height: 63 / 812 * currentHeight,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 115 / 389 * currentWidth,
                  ),
                  const Text(
                    "Payment Success",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textGrey),
                  ),
                ],
              ),
              SizedBox(
                height: 16 / 812 * currentHeight,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    56 / 389 * currentWidth, 0, 70 / 389 * currentWidth, 0),
                child: const Text(
                  "We Will send order details and invoice in your registered email",
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 38 / 812 * currentHeight,
              ),
              GestureDetector(
                onTap: () => print("Check Details Tapped"),
                child: Row(
                  children: [
                    SizedBox(
                      width: 119 / 389 * currentWidth,
                    ),
                    const Text(
                      "Check Details",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGrey),
                    ),
                    SizedBox(
                      width: 10 / 389 * currentWidth,
                    ),
                    SvgPicture.asset('assets/rightArrow.svg'),
                  ],
                ),
              ),
              SizedBox(
                height: 48 / 812 * currentHeight,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 38 / 389 * currentWidth,
                  ),
                  SizedBox(
                    width: 302 / 389 * currentWidth,
                    height: (302 / 389 * currentWidth) / 6,
                    child: ElevatedButton(
                      onPressed: () => print("Download Invoices"),
                      child: Text(
                        "Download Invoice",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.lightGreen),
                          foregroundColor:
                              MaterialStateProperty.all(AppColors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16)))),
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
