import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';



class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {


  List<Map<String, Object>> statusLine = [

    {
      "circleColor" : AppColors.lightGreen,
      "lineText" : "Your Order is accepted",
      "isSelected" : true

    },

    {
      "circleColor" : AppColors.lightGreen,
      "lineText" : "Your Order is prepearing",
      "isSelected" : false

    },

    {
      "circleColor" : AppColors.lightGreen,
      "lineText" : "Your Order is bla bla",
      "isSelected" : false

    },

    {
      "circleColor" : AppColors.lightGreen,
      "lineText" : "DONE",
      "isSelected" : false

    }


  ]; 


  @override
  Widget build(BuildContext context) {
    
    final currentHeight = MediaQuery.sizeOf(context).height;
    final currentWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34 / 389 * currentWidth ),
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
      
          SizedBox(height: 116 / 812 * currentHeight ,),
      
           const Text("Order Status", style: TextStyle(
                      
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGrey
                      
            ),),


          SingleChildScrollView(
            child: Container(
              height: ((604.3 - 116) / 812) * currentHeight  ,
              child: ListView(

                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),

                children: [
                        
                  SizedBox(height: 8 / 812 * currentHeight,),

                  Column(
                    children: statusLine.map((status) {
                      return StatusLine(
                        circleColor: (status['circleColor'] as Color),
                        lineText: (status['lineText'] as String),
                        isSelected: (status['isSelected'] as bool),
                      );
                    }).toList(),
                  )

                  

                  // StatusLine(
                  //   circleColor: AppColors.lightGreen, 
                  //   lineText: "Your order is accepted",
                  //   isSelected: false,  
                  // ),
                    
                  // StatusLine(
                  //   circleColor: AppColors.lightGreen, 
                  //   lineText: "Your order is accepted",
                  //   isSelected: false,  
                  // ),
                                  
                  // StatusLine(
                  //   circleColor: AppColors.lightGreen, 
                  //   lineText: "Your order is accepted",
                  //   isSelected: true,  
                  // ),
                                  
                  // StatusLine(
                  //   circleColor: AppColors.lightGreen, 
                  //   lineText: "Your order is accepted",
                  //   isSelected: false,  
                  // ),
                ],
              ),
            ),
          ),

          Row(
            children: [

              SizedBox(width: 51 / 389 * currentWidth,),
              SizedBox(
              
                width: 209 / 389 * currentWidth ,
              
                child: ElevatedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all(AppColors.lightGreen),
                    foregroundColor: MaterialStateProperty.all(AppColors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                      )
                    )
                
                  ),
                  onPressed: () => print("Cancel Order"), 
                  child: Text("Cancel Order")
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}

class StatusLine extends StatelessWidget {
  
  final Color circleColor;
  final String lineText;
  final bool isSelected;

  const StatusLine({
    super.key, 
    required this.circleColor, 
    required this.lineText,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 60 / 812 * MediaQuery.sizeOf(context).height,

      child: (Row(
        children: <Widget>[
          isSelected ? SvgPicture.asset('assets/selected.svg') 
          :  SvgPicture.asset('assets/greenStatusCircle.svg',)
          
          ,
          SizedBox(width: 21 / 389 * MediaQuery.sizeOf(context).width ,),
          Text(lineText, style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
            ),)
        ],
      )),
    );
  }
}
