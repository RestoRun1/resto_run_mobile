import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Components/EndPageTextButton.dart';
import 'package:resto_run_mobile/Components/MyTextField.dart';
import 'package:resto_run_mobile/Components/PasswordTextField.dart';
import 'package:resto_run_mobile/Components/SignInButton.dart';
import 'package:resto_run_mobile/Pages/SignUp.dart';
import 'package:resto_run_mobile/backend_url.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:http/http.dart' as http;
import 'package:resto_run_mobile/secure_storage.dart';
import 'dart:convert';

import 'package:resto_run_mobile/user.dart'; // Import the dart:convert library



class SignIn extends StatelessWidget {

  Future<void> _handleLogin(BuildContext context) async{

    String username = usernameController.text;
    String password = passwordController.text;

    String loginUrl = BackendUrl.loginUrl;

    //String token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYW5hZ2VyMSIsInJvbGVzIjpbIlJPTEVfTUFOQUdFUiJdLCJpYXQiOjE3MTQ5OTMzMTAsImV4cCI6MTcxNTA3OTcxMH0.v63OXQ-vPMFcvO8A0B0HbLw-s0vKwIRHu0jgYAkFIbs";
    //List<String> roles;

    try{

      final response = await http.post(
      Uri.http("10.0.2.2:8080", "/api/customer/login", {"username": username, "password": password}),
      
      // headers: {
      //   'Authorization': "Bearer $token",
      // },
    );

    final responseToken = await http.post(
      Uri.http("10.0.2.2:8080", "/api/auth/login"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

   
    Map<String , dynamic> responseJson = json.decode(responseToken.body);
    String token = responseJson["token"];

    
    //debugPrint(responseJson["token"]); 

      if(response.statusCode != 200){

        await Fluttertoast.showToast(
          msg: "Wrong Credentials",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.lightGreen,
          textColor: AppColors.white, 
        );

        return;
      }

      else{
        SecureStorage storage = SecureStorage();
        Map<String, dynamic> user = json.decode(response.body);
        debugPrint(user.toString());
        var userIdType = user["userId"].runtimeType;
        debugPrint(userIdType.toString());
        User singletonUser = User();
        singletonUser.setEmail(user['email']);
        singletonUser.setUserId("${user['userId']}");
        singletonUser.setUsername(user['username']);
        singletonUser.setPhoneNumber(user['phoneNumber']);
        singletonUser.setToken(token);

        debugPrint("TOKEN IS ->>>> $token");

        await storage.saveData("email", user['email']);
        await storage.saveData("userId", "${user['userId']}");
        await storage.saveData("username", user['username']);
        await storage.saveData("token", token);

        // I dont know why this code is necessity !!  
        if (!context.mounted) return;

        await Fluttertoast.showToast(
          msg: "Welcome to RestoRun",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.lightGreen,
          textColor: AppColors.white, 
        );

        Navigator.pushReplacementNamed(context, '/mainPage');
      
      }


    } catch(e){
      debugPrint(e.toString());
    }   

  }


  SignIn({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final personIcon = const Icon(Icons.person);
  

  void goSignUp(BuildContext context){
    Navigator.pushNamed(context, '/signUp');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color.fromRGBO(142, 176, 148, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                  controller: usernameController,
                  hintText: "Email or User Name",
                  obscureText: false, 
                  icon: personIcon,),
              const SizedBox(
                height: 30,
              ),
              PasswordTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
              
              const SizedBox(
                height: 10,
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: TextButton(
                        onPressed: () {
                          print("Forgot Password Clicked");
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color.fromRGBO(142, 176, 148, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              

              const Spacer(),

              Column(
                children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(Color.fromRGBO(142, 176, 148, 1))
                            
                          ),
                          onPressed: () {
                            _handleLogin(context);
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: EndPageTextButton(
                          description: "Don't Have Account ?",
                          buttonText: "Sign Up",
                          touchButton: goSignUp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}




/*
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 50,),

                  const Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.blue, 
                        fontSize: 50
                      ),

                  ),

                  const SizedBox(height: 25,),

                  MyTextField(
                    controller: usernameController,
                    obscureText: false,
                    hintText: "Enter Email",
                  ),

                  SizedBox(height: 25),

                  MyTextField(
                    controller: passwordController,
                    obscureText: true,
                    hintText: "Enter Password",

                  ),

                  SizedBox(height: 3,),

                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Row(
                    
                      mainAxisAlignment: MainAxisAlignment.end,
                    
                      children: [Text("Forgot Password")],
                      
                    ),
                  )
                  */