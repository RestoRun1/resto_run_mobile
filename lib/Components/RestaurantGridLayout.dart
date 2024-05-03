import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:resto_run_mobile/backend_url.dart';
import 'dart:convert';



class RestaurantGridLayout extends StatefulWidget {
  const RestaurantGridLayout({super.key});

  @override
  State<RestaurantGridLayout> createState() => _RestaurantGridLayout();
}

class _RestaurantGridLayout extends State<RestaurantGridLayout> {

  List<dynamic> restaurants = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    _getRestaurants().then((data) {

      restaurants = data;
      isLoading = false;
      print(restaurants);

    }).catchError((onError){

      debugPrint(onError.toString());

    });
      
    


  }

  Future<List<dynamic>> _getRestaurants() async{
    
    String allRestaurantUrl = BackendUrl.getAllRestaurants;

    try{

      final response = await http.get(
        Uri.parse(allRestaurantUrl)
      );

      if(response.statusCode != 200){
        throw Error();
      }

      debugPrint(response.body.toString());
      List<dynamic> restaurant = json.decode(response.body);
      return restaurant;

    }catch(e){
      debugPrint(e.toString());
      throw Error();
    }

  }


  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.fromLTRB(30 / 389 * currentWidth, 0, 38 / 389 * currentWidth, 18 / 812 * currentHeight ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 24.0,
              ),
              itemCount: restaurants.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  
                  onTap: () {
                    
                    if(isLoading == false){
                      //print(">>>>>>>>>" + restaurants[index].toString());
                      Navigator.pushNamed(
                        
                        context, 
                        "/restaurant",
                        arguments: {

                          'id' : restaurants[index]['id'],
                          "restaurantName" : restaurants[index]['name']

                        }
                        
                      );


                    }

                  },
          
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: SizedBox(
                        
                      width: 150 / 389 * currentWidth,
                      height: 136 / 812 * currentHeight,
                        
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/res.jpg",
                              fit: BoxFit.cover,
                            ),
                            Text(
                              restaurants[index]['name'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ]),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
