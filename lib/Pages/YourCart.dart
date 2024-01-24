import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/helper.dart';
import 'package:resto_run_mobile/main.dart';
import 'package:sizer/sizer.dart';
import 'package:logger/logger.dart';

List<Map<String, String>> shopItems = [
  {
    'brand': "Milk",
    'description': "It is a milk",
    'price': "165",
    'image': "assets/bottle_milk.png"
  },
  {
    'brand': "Milk",
    'description': "It is a milk",
    'price': "165",
    'image': "assets/bottle_milk.png"
  },
];

class YourCart extends StatefulWidget {
  const YourCart({super.key});

  @override
  State<YourCart> createState() => _YourCart();
}

class _YourCart extends State<YourCart> {
  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    void handleCheckout() {
      Navigator.pushNamed(context, '/checkout');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: SizedBox(
          width: Helper.dependOnWidth(45) * currentWidth,
          child: Container(
            decoration:
                const BoxDecoration(color: AppColors.backgroundLightWhite),
            child: BackButton(color: AppColors.lightGreen),
          ),
        ),
      ),
      body: SafeArea(
        child: Sizer(
          builder: (context, orientation, deviceType) => SafeArea(
            child: Container(
              color: AppColors.white,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.sp, vertical: 16.0.sp),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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

                      Flexible(
                        child: ListView(
                          shrinkWrap: false,
                          physics: ClampingScrollPhysics(),
                          children: shopItems
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: (ShoppingCartItem(shopItem: e)),
                                  ))
                              .toList(),
                        ),
                      ),

                      SizedBox(
                        height: 3.h,
                      ),

                      SizedBox(
                        height: 3.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "₹ 1,527",
                            style: TextStyle(
                                color: AppColors.lightGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 3.h,
                      ),

                      AspectRatio(
                        aspectRatio: 335 / 62,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightGreen),
                          onPressed: handleCheckout,
                          child: Text(
                            "Proceed to checkout",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      )

                      //getProduct(context)
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShoppingCartItem extends StatefulWidget {
  final Map<String, String> shopItem;

  const ShoppingCartItem({super.key, required this.shopItem});

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItem();
}

class _ShoppingCartItem extends State<ShoppingCartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.productBackColor,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(234, 221, 205, 1),
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  widget.shopItem["image"]!,
                  height: 100,
                )),
            SizedBox(
              width: 3.w,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.shopItem["brand"]!,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.shopItem["description"]!,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.shopItem['price']!,
                        style: TextStyle(
                            color: AppColors.lightGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => print("Minus Is Clicked"),
                                icon: Icon(
                                  Icons.remove,
                                  color: AppColors.lightGreen,
                                )),
                            Text(
                              "1",
                            ),
                            IconButton(
                                onPressed: () => print("Plus Is Clicked"),
                                icon: Icon(Icons.add,
                                    color: AppColors.lightGreen)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
