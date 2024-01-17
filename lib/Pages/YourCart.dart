import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/main.dart';
import 'package:sizer/sizer.dart';

class YourCart extends StatefulWidget {
  const YourCart({super.key});

  @override
  State<YourCart> createState() => _YourCart();
}

class _YourCart extends State<YourCart> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => SafeArea(
        child: Container(
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Your Cart",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              getProduct(context)
            ]),
          ),
        ),
      ),
    );
  }

  Widget getProduct(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => Container(
              
              color: AppColors.productBackColor ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(234, 221, 205,1),
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Image.asset("assets/bottle_milk.png", fit: BoxFit.contain,)
                        )  
                      ),

                    SizedBox(width: 2.w,),

                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Lauren's", style: TextStyle(color: AppColors.productText, fontSize: 10.sp, fontWeight: FontWeight.bold),),
                              Text("Orange Juice", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: AppColors.productText),),
                              Text("TL 149", style: TextStyle( fontWeight: FontWeight.bold,fontSize: 12.sp ,color: AppColors.lightGreen),),
                            ]),
                        )  
                      ),
                    Expanded(
                        flex: 1,
                         child: Container(
                          color: Colors.red,
                           child: Text(
                            "Efe"
                          ),
                         )     
                    ),
                  ],
                ),
              ),
            ));
  }
}
