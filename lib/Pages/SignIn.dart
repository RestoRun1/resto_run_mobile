import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Components/GoSignUpButton.dart';
import 'package:resto_run_mobile/Components/MyTextField.dart';
import 'package:resto_run_mobile/Components/PasswordTextField.dart';
import 'package:resto_run_mobile/Components/SignInButton.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text("Sign In",
                          style: TextStyle(
                            color: Color.fromRGBO(142, 176, 148, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30,),

                  MyTextField(
                    controller: usernameController, hintText: "Email or User Name", obscureText: false
                  ),

                  SizedBox(height: 30,),

                  PasswordTextField(controller: passwordController, hintText: "Password", obscureText: true),

                  SizedBox(height: 10,),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text("Forgot Password?",
                            style: TextStyle(
                             color: Color.fromRGBO(142, 176, 148, 1),
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                            ),
                        
                        ),
                      ),
                    ], 
                  ),

                  const Spacer(),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: GoSignUpButton(),
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