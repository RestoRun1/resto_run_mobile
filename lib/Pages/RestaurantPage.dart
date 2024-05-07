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
import 'package:resto_run_mobile/user.dart';

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

      backgroundColor: AppColors.lightGreen,
      appBar: AppBar(

        actions: <Widget> [
          
          Padding(
            padding: const EdgeInsets.all(3),

            child: TextButton(
              onPressed: () {
                
                
                showDialog(
                  context: context, 
                  builder: (BuildContext context) {

                    return ReservationDialog(resId: id,);

                  });

              }, 
              
              child: const Text(
                "Make Reservation",
                style: TextStyle(

                  color: AppColors.lightGreen

                ),


               )
              ),
          )


        ],

        title: Row(
          children: [
            Text("${restaurantName}" ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
          
            children: [
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

    // debugPrint("GET ALL MEANS ENTERED AND ID IS $resId");

    // String url = "${BackendUrl.mealById}?resId=$resId";
    // //final Uri uri = Uri.parse(url);

    final String resIdParam = Uri.encodeQueryComponent("$resId");


    // final Uri uri = Uri(
    //   host: "10.0.0.2",
    //   port: 8080,
    //   path: "/api/meal/retrieveMealById",
    //   queryParameters: {'resId': resIdParam},
    // );

    debugPrint("GET ALL MEALS ->>>>>> ${User().token}");

    final Uri uri = Uri.http("10.0.2.2:8080", "${BackendUrl.mealById}", {'resId': "$resId"});


    try{
      
     final response = await http.get(
    uri,
    
    headers: {
      'Authorization': 'Bearer ${User().token}',
    },
  );

      debugPrint("RESPONSE CODE IS ->>> ${response.statusCode}");

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

          return Column(

            children: allMeals.map((e) { 
              
              return Column(
                children: [
                  MealSection(meal: e),
                  const SizedBox(height: 10,)
                ],
              );
            
            }).toList()

          );

          // return ListView.separated(
          //   scrollDirection: Axis.vertical,
          //   separatorBuilder: (context, index) => SizedBox(height: 10), // Define separator between items
          //   shrinkWrap: true,
          //   itemCount: allMeals.length,
          //   itemBuilder: (context, index) {
              
          //     return MealSection(meal: allMeals[index]);
          
          //   },
          // );
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
                            Text("${_meal["price"]}\$"),
                            
                            ElevatedButton(

                              style: const ButtonStyle(

                                backgroundColor: MaterialStatePropertyAll(AppColors.backgroundLightWhite)


                              ),

                              onPressed: () { 
                                
                                Navigator.push(

                                  context,
                                  MaterialPageRoute(builder: (context) => MealOrder(meal: _meal))

                                );
                              
                              }, 
                              
                              child: const Text(
                                "Order Now",
                                style: TextStyle(

                                  color: AppColors.lightGreen

                                ),
                                )
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

class ReservationDialog extends StatefulWidget {

  final int resId; 

  ReservationDialog({
      super.key,
      required this.resId
    }
  );

  @override
  _ReservationDialogState createState() => _ReservationDialogState();
}

class _ReservationDialogState extends State<ReservationDialog> {
  DateTime _selectedDate = DateTime.now();
  int _numberOfGuests = 1;
  String _specialRequest = '';

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _selectedDate,
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != _selectedDate) {
    setState(() {
      _selectedDate = picked;
    });
  }
}


  @override
  Widget build(BuildContext context) {


    return AlertDialog(

      backgroundColor: AppColors.white,

      title: Text('Reservation'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Date: ${DateConverter.convertHumanLanguage(_selectedDate)}'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select Date'),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Number of Guests',
            ),
            onChanged: (value) {
              setState(() {
                _numberOfGuests = int.tryParse(value) ?? 1;
              });
            },
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Special Request',
            ),
            onChanged: (value) {
              setState(() {
                _specialRequest = value;
              });
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
              
            DateConverter.convertJavaVersion(_selectedDate);

            // print('Date: $_selectedDate');
            // print('Number of Guests: $_numberOfGuests');
            // print('Special Request: $_specialRequest');
            
            String url = BackendUrl.addReservation;

            final Uri uri = Uri.http("10.0.2.2:8080", "api/reservation/saveReservation");

            final response = await http.post(

              uri,
                headers: <String, String> {
                  'Content-Type' : 'application/json; charset=UTF-8',
                  'Authorization': 'Bearer ${User().token}',

                },

                body: jsonEncode(<String, dynamic>{
                  'tableId' : 1, 
                  'customerId' : int.parse (User().userId),
                  'reservationTime' : DateConverter.convertJavaVersion(_selectedDate),
                  'numberOfGuests' : _numberOfGuests,
                  'specialRequests' : _specialRequest,
                  "restaurantId" : widget.resId
                })


            );
            

            print(response.statusCode);
            
            
            Navigator.of(context).pop();
          },
          child: const Text('Reserve'),
        ),
      ],
    );
  }
}

class DateConverter{


  static String convertJavaVersion(DateTime time){

    List<String> charArray = time.toString().split('');
    charArray[10] = "T";
    String result = charArray.join("");
    // print("CONVERTED STRING IS RESULT ${result}"); 
    return result;
    

  } 


  static String convertHumanLanguage(DateTime time){

    String monthText = "";

    final day = time.day;
    final year = time.year;
    final month = time.month;

    switch (month) {
    case 1:
      monthText = "January";
      break;
    case 2:
      monthText = "February";
      break;
    case 3:
      monthText = "March";
      break;
    case 4:
      monthText = "April";
      break;
    case 5:
      monthText = "May";
      break;
    case 6:
      monthText = "June";
      break;
    case 7:
      monthText = "July";
      break;
    case 8:
      monthText = "August";
      break;
    case 9:
      monthText = "September";
      break;
    case 10:
      monthText = "October";
      break;
    case 11:
      monthText = "November";
      break;
    case 12:
      monthText = "December";
      break;
    default:
      print('Invalid month');
  }
    return "${day} ${monthText} ${year}";
  }
}