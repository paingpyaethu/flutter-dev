import 'package:api/auth/api_client.dart';
import 'package:api/auth/login_status.dart';
import 'package:api/auth/store.dart';
import 'package:api/models/message.dart';
import 'package:api/models/user.dart';
import 'package:api/ui/register_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String message = "";
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.purple),
          width: double.infinity, // 100% width of the screen
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Login Screen",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "Please Login!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        "${message}",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          // decoration: BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            Form(
                                key: key,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          // border: Border(
                                          //     bottom: BorderSide(
                                          //         width: 1, color: Colors.purple))

                                          ),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          // border: InputBorder.none
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Email Must Not Be Empty";
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Password Must Not Be Empty";
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RegisterScreen();
                                  }));
                                },
                                child: Text(
                                  "Create New Account",
                                  style: TextStyle(color: Colors.black),
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        primary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        backgroundColor: Colors.purple,
                                        textStyle: TextStyle(fontSize: 16)),
                                    onPressed: () async {
                                      if (key.currentState!.validate()) {
                                        User user = User(
                                            "admin",
                                            emailController.text,
                                            passwordController.text);
                                        Message mes =
                                            await ApiClient(Dio()).login(user);
                                        if (mes.status) {
                                          Provider.of<Store>(context,
                                                  listen: false)
                                              .setApi(mes.api);
                                          Provider.of<LoginStatus>(context,
                                                  listen: false)
                                              .setStatus(true);
                                        } else {
                                          setState(() {
                                            message = mes.message;
                                          });
                                        }
                                      }
                                    },
                                    child: Text("Login"))),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
