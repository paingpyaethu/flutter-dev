import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_firebase/bloc_page/bloc_event.dart';
import 'package:todo_bloc_firebase/bloc_page/bloc_page.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          "Please Register",
                          style: TextStyle(letterSpacing: 1, fontSize: 18),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Column(children: [
                          Form(
                              key: key,
                              child: Column(
                                children: [
                                  Container(
                                      child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: "Enter Name",
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.amber,
                                                width: 2))),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Name is required";
                                      }
                                      return null;
                                    },
                                  )),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                      child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: "Enter Email",
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.amber,
                                                width: 2))),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Email is required";
                                      }
                                      return null;
                                    },
                                  )),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                      child: TextFormField(
                                          controller: pwdController,
                                          decoration: InputDecoration(
                                              hintText: "Enter Password",
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.amber,
                                                          width: 2))),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Password is required";
                                            }
                                            return null;
                                          })),
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          TextButton(
                              onPressed: () =>
                                  BlocProvider.of<BlocPage>(context)
                                      .add(LoginEvent()),
                              child: Text(
                                  "Already have an account? Please Login!")),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5)),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 40,
                            margin: EdgeInsets.only(bottom: 30),
                            child: OutlinedButton(
                                onPressed: () {
                                  if (key.currentState!.validate()) {
                                  } else {}
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.black54),
                                )),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
