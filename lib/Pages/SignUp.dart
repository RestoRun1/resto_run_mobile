import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Color/AppColors.dart';
import 'package:resto_run_mobile/Components/EndPageTextButton.dart';
import 'package:resto_run_mobile/Components/MyTextField.dart';
import 'package:resto_run_mobile/Components/PasswordTextField.dart';
import 'package:resto_run_mobile/Components/SignInButton.dart';
import 'package:resto_run_mobile/Pages/SignIn.dart';
import 'package:http/http.dart' as http;
import 'package:resto_run_mobile/backend_url.dart';
import 'package:fluttertoast/fluttertoast.dart';



final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
final nameController = TextEditingController();
final emailController = TextEditingController();
final phoneController = TextEditingController();

const  personIcon = Icon(Icons.person);
const  emailIcon =  Icon(Icons.email);
const phoneIcon =   Icon(Icons.phone);

class SignUp extends StatelessWidget {

  Future<void> _handleSignUp() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmedPassword = confirmPasswordController.text;
    String phoneNumber = phoneController.text;

    String saveCustomerURL = BackendUrl.saveCustomer;

    try {
      final response = await http.post(

        Uri.http( "10.0.2.2:8080" , saveCustomerURL),
        headers: <String, String> {
          'Content-Type' : 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username' : name,
          'email' : email,
          'password' : password,
          'confirmedPassword' : confirmedPassword,
          'phoneNumber' : phoneNumber
        })
      );

      
      if(response.statusCode != 200){
        Fluttertoast.showToast(
          msg: "Error you cannot sign up",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.lightGreen,
          textColor: AppColors.white
        );
        return;
      }

      Fluttertoast.showToast(
          msg: "Thanks For Sign Up",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: AppColors.lightGreen,
          textColor: AppColors.white 
      );

    } catch (e) {
      debugPrint(e.toString());
    }
  }

  const SignUp({super.key});

  void goSignIn(BuildContext context) {
    Navigator.pushNamed(context, '/signIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromRGBO(142, 176, 148, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              MyTextField(
                  controller: nameController,
                  hintText: "Full Name",
                  obscureText: false,
                  icon: personIcon),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                  icon: emailIcon),
              const SizedBox(height: 45),

              MyTextField(
                  controller: phoneController,
                  hintText: "Phone Number",
                  obscureText: false,
                  icon: phoneIcon),
              const SizedBox(height: 45),

              PasswordTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: false),
              const SizedBox(
                height: 15,
              ),
              PasswordTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: false),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(142, 176, 148, 1))),
                      onPressed: () {
                        _handleSignUp();
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: EndPageTextButton(
                      description: "Already Have Account ?",
                      buttonText: "Sign In",
                      touchButton: goSignIn,
                    ),
                  )
                ],
              )
            ]),
          ),
        ));
  }
}
