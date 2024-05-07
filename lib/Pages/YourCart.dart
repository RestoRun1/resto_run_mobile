import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Components/BackButtonComponent.dart';
import 'package:resto_run_mobile/Model/shopping_cart.dart';
import 'package:resto_run_mobile/helper.dart';
import 'package:resto_run_mobile/main.dart';
import 'package:sizer/sizer.dart';
import 'package:logger/logger.dart';

// List<Map<String, String>> shopItems = [
//   {
//     'brand': "Milk",
//     'description': "It is a milk",
//     'price': "165",
//     'image': "assets/bottle_milk.png"
//   },
//   {
//     'brand': "Milk",
//     'description': "It is a milk",
//     'price': "165",
//     'image': "assets/bottle_milk.png"
//   },
//   {
//     'brand': "Milk",
//     'description': "It is a milk",
//     'price': "165",
//     'image': "assets/bottle_milk.png"
//   },
// ];

class YourCart extends StatefulWidget {
  const YourCart({super.key});

  @override
  State<YourCart> createState() => _YourCart();
}

class _YourCart extends State<YourCart> {

  bool rerender = false;

  triggerRender(){

    setState(() {
      rerender = !rerender;
    });

  }

  @override
  Widget build(BuildContext context) {

    debugPrint("SD");
    
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    final double _sum = ShoppingCart().getSum();

    void handleCheckout() {
      Navigator.pushNamed(context, '/checkout');
    }

    return Scaffold(
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

                      BackButtonComponent(),

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
                        height: Helper.dependOnHeight(41) * currentHeight,
                      ),
                    
                      getMainWidget(),

                      SizedBox(
                        height: 3.h,
                      ),

                      SizedBox(
                        height: 3.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                                color: AppColors.textGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " \$ ${ _sum.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: AppColors.lightGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 3.h,
                      ),

                      Container(
                        width: double.infinity,
                        height: Helper.dependOnHeight(60) * currentHeight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightGreen,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          onPressed: handleCheckout,
                          child: const Text(
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

  Widget getMainWidget() {

    if(ShoppingCart().getListMap().isEmpty){

      return const Expanded(
        child: Center(
          child: Text("Shopping Cart is empty"),
        ),
      );

    }



    return Flexible(
                      child: ListView(
                        shrinkWrap: false,
                        physics: ClampingScrollPhysics(),
                        children: ShoppingCart().getListMap()
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: (ShoppingCartItem(shopItem: e, isRerender: rerender, triggerRender: triggerRender ,)),
                                ))
                            .toList(),
                      ),
                    );
  }
}

class ShoppingCartItem extends StatefulWidget {
  final Map<String, String> shopItem;
  final bool isRerender;
  final Function triggerRender;

  const ShoppingCartItem({super.key, required this.shopItem, required this.isRerender, required this.triggerRender});

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItem();
}

class _ShoppingCartItem extends State<ShoppingCartItem> {

  late int itemCount;
  late bool isRerender;

  @override
  void initState(){

    super.initState();
    itemCount = int.parse(widget.shopItem["itemCount"]!);
    isRerender = widget.isRerender;
  }

  @override
  Widget build(BuildContext context) {
    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWitdh = MediaQuery.sizeOf(context).width;

    return Container(
      height: Helper.dependOnHeight(100) * currentHeight,
      decoration: BoxDecoration(
          color: AppColors.productBackColor,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(234, 221, 205, 1),
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset(
                  "assets/pizza2.png",
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
                    widget.shopItem["name"]!,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${(double.parse(widget.shopItem['price']!) * itemCount).toStringAsFixed(2)}",
                          style: const TextStyle(
                              color: AppColors.lightGreen,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,

                          ),
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if(itemCount != 0 ){
                                      itemCount--;
                                      ShoppingCart().setItemCountById(int.parse(widget.shopItem["id"]!), itemCount);
                                      isRerender = !isRerender;
                                      widget.triggerRender();
                                    }
                                  });

                                  if(itemCount == 0){
                                    ShoppingCart().removeElement(int.parse(widget.shopItem["id"]!));
                                  }

                                },
                              ),
                              Text(
                                '${itemCount}',
                                style: TextStyle(fontSize: 12),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {

                                  setState(() {
                                    itemCount++;
                                    ShoppingCart().setItemCountById(int.parse(widget.shopItem["id"]!), itemCount);
                                    isRerender = !isRerender;
                                    widget.triggerRender();
                                  });

                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
