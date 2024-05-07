import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Components/BackButtonComponent.dart';
import 'package:resto_run_mobile/Model/shopping_cart.dart';
import 'package:resto_run_mobile/helper.dart';

class MealOrder extends StatefulWidget{



  final Map<String, dynamic> meal;

  MealOrder({

    super.key,
    required this.meal

  });

  @override
  State<MealOrder> createState() => _MealOrderState();
}

class _MealOrderState extends State<MealOrder> {

  addToCart(){
    ShoppingCart().addMeal(_meal, _mealCount);
  }

  
  late Map<String, dynamic> _meal;
  int _mealCount = 1;
  bool _showFullDescription = false;

  void initState(){
    super.initState();
    _meal = widget.meal;
  }
  
  
  @override
  Widget build(BuildContext context){

    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(

      
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,          
          children: [

            Column(

              children: [

                const Text("Price", 
                  style: TextStyle(
                    color: AppColors.dotGrey
                  ),
                ),

                Text("\$${_meal["price"] * _mealCount}", 
                  style: const TextStyle(
                    color: AppColors.lightGreen,
                    fontSize: 18
                  ) ,
                )

              ],

            ),

            SizedBox(
              width: Helper.dependOnWidth(217) * currentWidth,
              height: Helper.dependOnHeight(62) * currentHeight ,
              child: ElevatedButton(
                onPressed: () {
                addToCart();
              }, 
                
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.resolveWith<Color>(

                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey; // Use grey color if button is disabled
                    }
                    return AppColors.mealOrderDarkGreen; // Use custom color otherwise
                  },

                  ),

                ),

                child: const Text(
                  "Add to Cart",
                  style: TextStyle(color: AppColors.white),  
                ),

              ),
            )


          ],

        ),
      ),
      appBar: AppBar(
        leading: BackButtonComponent(),
        title: Text("Detail", textAlign: TextAlign.center,),
        centerTitle: true,

      ),

      body: SafeArea(

        child: Padding(
          padding: EdgeInsets.fromLTRB(

            Helper.dependOnWidth(30) * currentWidth,
            8,
            Helper.dependOnWidth(30) * currentWidth,
            8

          ),

          child: Column(
          
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [
          
              Center(
                child: Container(
          
                  width: double.infinity,
                  height: Helper.dependOnHeight(226) * currentHeight ,
                
                  child: Image.asset("assets/pizza2.png")
                ),
              ),
          
              Text(
                "${_meal["name"]}",
                style: const TextStyle(

                  fontSize: 22,
                  fontWeight: FontWeight.bold
                  

                ),
              ),

              SizedBox(height: Helper.dependOnHeight(33) * currentHeight,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {

                      setState(() {

                        if(_mealCount != 0 ){
                           _mealCount--;
                        } 

                      });

                    },
                  ),
                  Text(
                    '$_mealCount',
                    style: TextStyle(fontSize: 12),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {

                      setState(() {
                        _mealCount++;
                      });

                    },
                  ),
                ],
              ),
              
              Divider(),
              SizedBox(height: Helper.dependOnHeight(15) * currentHeight,),

              const Text(
                "Description",
                style: TextStyle(
                  color: AppColors.searchBarGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: Helper.dependOnHeight(12) * currentHeight,),
              Text(
                _meal["description"].length > 140 && !_showFullDescription
                    ? _meal["description"].substring(0, 140) + "..."
                    : _meal["description"],
                maxLines: !_showFullDescription ? 7 : null,
              ),
              if (_meal["description"].length > 140)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showFullDescription = !_showFullDescription;
                    });
                  },
                  child: Text(
                    _showFullDescription ? "Read Less" : "Read More",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),


              
            ],
          
          ),
        )

      ),

    );

  }
}