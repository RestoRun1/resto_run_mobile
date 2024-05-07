import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resto_run_mobile/user.dart';
import 'package:http/http.dart' as http;

class ShoppingCart {

    static final ShoppingCart _instance = ShoppingCart._internal();

    factory ShoppingCart(){
      return _instance;
    }

    ShoppingCart._internal();

    List<ShoppingElement> _mealList = [];

    addMeal(Map<String, dynamic> meal, int count){

      if(count <= 0) {

        throw Exception("Item Count must be positive");

      }


      for(int a = 0; a < _mealList.length; a++){
        if(meal["id"] == _mealList[a].id){
          _mealList[a].itemCount += count;
          return;
        }
      }

      ShoppingElement element = ShoppingElement(

        id: meal["id"],
        name: meal["name"],
        description: meal["description"],
        price: meal["price"],
        itemCount: count

      );

      _mealList.add(element);
    }

  List<Map<String, String>> getListMap() {
    return _mealList.map((element) {
      return {
        'id': element.id.toString(),
        'name': element.name,
        'description': element.description,
        'price': element.price.toString(),
        'itemCount': element.itemCount.toString(),
      };
    }).toList();
  }


  List<ShoppingElement> getMealList(){
    return _mealList;
  }

  double getSum(){
    double sum = 0.0;
    for(int a = 0; a < _mealList.length; a++){
      sum += _mealList[a].price * _mealList[a].itemCount;
    }
    return sum;
  }

  void setItemCountById(int id, int itemCount){
    for(int a = 0; a < _mealList.length; a++){
      if(id == _mealList[a].id){
        _mealList[a].setItemCount(itemCount);
        return;
      }
    }
  }

  void clear(){
    _mealList.clear();
  }

  void removeElement(int id){
    _mealList.removeWhere((element) => element.id == id);
  }

  void orderAllList() async {
    int sum = 0;

    final mealId = List<int>.filled(3, 0, growable: true); // [0, 0, 0]

    for(int a = 0; a < _mealList.length; a++){
        sum += _mealList[a].itemCount;
        mealId[a] = _mealList[a].id;
    }

    int itemIterator = 0;
    int itemCountSize = 0;

    while(itemCountSize < _mealList.length){

      ShoppingElement tempMeal = _mealList[itemCountSize];
      
      for(int a = 0; a < tempMeal.itemCount; a++){
        mealId[itemIterator] = tempMeal.id;
        itemIterator++;  
      }

      itemCountSize++;
    }

    debugPrint(mealId.toString());


    Map<String , dynamic> order = {
      "status" : "PENDING",
      "quantity" : sum,
      "customerId" : int.parse(User().userId),
      "tableId" : 1,
      "mealIds" : mealId
    };

    final response = await http.post(
      Uri.http("10.0.2.2:8080", "api/order/saveOrder"),
      headers: <String, String> {
                  'Content-Type' : 'application/json; charset=UTF-8',
                  'Authorization': 'Bearer ${User().token}',

      },
      body: jsonEncode(order)
    );
    
    debugPrint(response.statusCode.toString());    

  }
}


class ShoppingElement {

  int id;
  String name;
  String description;
  double price;
  int itemCount;

  ShoppingElement({
      required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.itemCount,
    }) {
      if (itemCount <= 0) {
        throw ArgumentError('ItemCount must be bigger than 0');
      }
    }

  void setItemCount(int itemCount){
    this.itemCount = itemCount;
  }


}

