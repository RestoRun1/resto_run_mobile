
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Components/HomeSearchBar.dart';
import 'package:resto_run_mobile/Pages/MealOrder.dart';
import 'package:resto_run_mobile/backend_url.dart';
import 'package:resto_run_mobile/helper.dart';
import 'package:http/http.dart' as http;



class RestaurantPage extends StatefulWidget{

  String? restaurantName;
  int? resId;

  RestaurantPage({

    super.key,
    this.restaurantName,
    this.resId

  });


  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  // late String _restaurantName;
  // late int _resId;

  // @override
  // void initState(){

  //   super.initState();
  //   _restaurantName = widget.restaurantName!;
  //   _resId = widget.resId!;
  //   debugPrint("$_resId");
  // }



  @override
  Widget build(BuildContext context){

    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;
    

    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final int id = args['id'];
    final String restaurantName = args['restaurantName'];

    return Scaffold(

      backgroundColor: Color.fromARGB(255, 156, 138, 138),
      appBar: AppBar(

        title: Row(
          children: [
            Text(restaurantName),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
          
            children: [
          
              const HomeSearchBar(),
              SizedBox(height: Helper.dependOnHeight(24) * currentHeight,),
              MealList(resId: id)
              //MealList(resId: id)
          
            ],
          
          ),
        ),
      ),

    );

  }
}


class MealList extends StatefulWidget{

  final int resId;


  MealList(

    {
      super.key,
      required this.resId
    }


  );



  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {

  Future<List<dynamic>> _getAllMeals(int resId) async{

    debugPrint("GET ALL MEANS ENTERED AND ID IS $resId");

    String url = "${BackendUrl.mealById}?resId=$resId";
    final Uri uri = Uri.parse(url);


    try{
      
      final response = await http.get(uri);

      if(response.statusCode != 200){
        throw Exception("Response code is ${response.statusCode}");
      }

      final List<dynamic> responseData = json.decode(response.body);
      debugPrint("->>>>>>>>" + responseData.toString());
      return responseData;

    }catch(e){
      throw Error();
    }


  }


  late int _resId;
  late List<dynamic> allMeals;

  @override
  void initState() {

    super.initState();
    _resId = widget.resId;
    print("->>>>>>  $_resId");
    _getAllMeals(_resId).then((value) => allMeals = value);

  }




  @override
  Widget build(BuildContext context){

    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return FutureBuilder(
      future: _getAllMeals(_resId),
      builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }

        else if(snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        else{
          return ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => SizedBox(height: 10), // Define separator between items
            shrinkWrap: true,
            itemCount: allMeals.length,
            itemBuilder: (context, index) {
              
              return MealSection(meal: allMeals[index]);
          
            },
          );
        }
      }
    );
  }
}

class MealSection extends StatefulWidget{

  final Map<String, dynamic> meal;

  MealSection({
    super.key,
    required this.meal
  });

  @override
  State<MealSection> createState() => _MealSectionState();
}

class _MealSectionState extends State<MealSection> {

  late Map<String, dynamic> _meal;


  void initState(){

    super.initState();
    _meal = widget.meal;

  }

  @override
  Widget build(BuildContext context){

    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return Container(

      decoration: BoxDecoration(

        color: AppColors.white,
        borderRadius: BorderRadius.circular(40)

      ),

      
      width: double.infinity,
      height: Helper.dependOnHeight(175) * currentHeight,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/pizza2.png"),
                ),

                SizedBox(width: 20,),

                Expanded(
                  child: Container(
                    child: Column(                    
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${_meal["name"]}"),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${_meal["price"]}₺"),
                            
                            ElevatedButton(
                              onPressed: () { 
                                
                                Navigator.push(

                                  context,
                                  MaterialPageRoute(builder: (context) => MealOrder(meal: _meal))

                                );
                              
                              }, 
                              
                              child: Text("Order Now")
                            ),

                          ],
                        )


                      ],
                    ),
                  ),
                )

              ],
            ),
          )

        ],

      ),

    );

  }
}