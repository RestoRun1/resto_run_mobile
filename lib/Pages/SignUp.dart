import 'package:flutter/material.dart';
import 'package:resto_run_mobile/Components/EndPageTextButton.dart';
import 'package:resto_run_mobile/Components/MyTextField.dart';
import 'package:resto_run_mobile/Components/PasswordTextField.dart';
import 'package:resto_run_mobile/Components/SignInButton.dart';
import 'package:resto_run_mobile/Pages/SignIn.dart';

final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
final nameController = TextEditingController();
final emailController = TextEditingController();

final personIcon = const Icon(Icons.person);
final emailIcon = const Icon(Icons.email);

class SignUp extends StatelessWidget {
  SignUp({super.key});

  void goSignIn(BuildContext context) {
    Navigator.pushNamed(context, '/signIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(

                  child: SingleChildScrollView(
                    child: Column( mainAxisAlignment: MainAxisAlignment.center, children: [
                      
                      const SizedBox(height: 50,),
                      
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:<Widget>[
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
                      const SignInButton(text: "Sign Up"),
                       
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
