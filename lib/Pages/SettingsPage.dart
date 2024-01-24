import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/helper.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    final double currentHeight = MediaQuery.sizeOf(context).height;
    final double currentWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
        body: SafeArea(
      child: Container(
        color: AppColors.darkGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Align(
              
              alignment: Alignment.topLeft,
              child: Column(

                children: [
                  Row(
                    children: [

                      SizedBox(width: Helper.dependOnWidth(20) * currentWidth,),

                      SizedBox(

                        height: Helper.dependOnWidth(44) * currentWidth,
                        width: Helper.dependOnWidth(44) * currentWidth,

                        child: Container(

                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(9)
                          ),

                          child: BackButton(

                            color: AppColors.lightGreen,

                          )
                        
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 4,),

                  Row(
                    children: [
                      SizedBox(width: Helper.dependOnWidth(20) * currentWidth,),
                      Text("Settings", style: TextStyle(

                        color: AppColors.white,
                        fontSize: 16

                      ),),
                    ],
                  ),

                  SizedBox(height: 10,)

                ],

              )
              
            ),

            SizedBox(
              height: Helper.dependOnHeight(637) * currentHeight,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,

                  borderRadius: BorderRadius.only(

                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),

                          )

                ),

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [

                    
                    
                    SizedBox(
                      
                      height: Helper.dependOnHeight(219) * currentHeight ,

                      child: Container(
                      
                        decoration: BoxDecoration(

                          color: AppColors.notificationGreen,

                          borderRadius: BorderRadius.only(

                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),

                          )

                        ),


                        child: Column(

                          children: [
                            
                            SizedBox(height: Helper.dependOnHeight(25.76) * currentHeight ,),

                            Align(

                              alignment: Alignment.center,
                              child: Text("Appearance", style: TextStyle(

                                color: AppColors.white,
                                fontSize: 16

                              ),)

                            ),

                            SizedBox(height: Helper.dependOnHeight(34.75) * currentHeight ,),

                            Row(

                              children: [

                                ElevatedButton(onPressed: 
                                  () => {}, 
                                
                                child: Text("System", 
                                style: TextStyle(

                                  color: AppColors.black

                                ),))

                              ],

                            )

                          
                          ],


                        ),

                      ),
                    )

                  ]),

              ),
            )
          ],
        ),
      ),
    ));
  }
}
