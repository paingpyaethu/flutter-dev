import 'package:api/auth/api_client.dart';
import 'package:api/auth/store.dart';
import 'package:api/models/message.dart';
import 'package:api/models/post.dart';
import 'package:api/ui/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPost extends StatefulWidget {
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    TextEditingController titleController = TextEditingController();
    TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("New Post"),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.purple),
          width: double.infinity, // 100% width of the screen
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Add New Post",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ],
                ),
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
                                        controller: titleController,
                                        decoration: InputDecoration(
                                          hintText: "Enter Title",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          // border: InputBorder.none
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Title Must Not Be Empty";
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: textController,
                                        decoration: InputDecoration(
                                          hintText: "Enter Description",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Description Must Not Be Empty";
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.2,
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
                                        String api = Provider.of<Store>(context,
                                                listen: false)
                                            .getApi();
                                        Post post = Post(
                                            0,
                                            titleController.text,
                                            textController.text);
                                        Message mes = await ApiClient(Dio())
                                            .createPost("Bearer ${api}", post);
                                        if (mes.status == true) {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Home();
                                          }));
                                        }
                                      }
                                    },
                                    child: Text("Save"))),
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
