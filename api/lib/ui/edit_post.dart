import 'package:api/auth/api_client.dart';
import 'package:api/auth/store.dart';
import 'package:api/main.dart';
import 'package:api/models/message.dart';
import 'package:api/models/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPost extends StatefulWidget {
  final int id;
  EditPost(this.id);
  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late TextEditingController titleController;
  late TextEditingController textController;
  @override
  void initState() {
    super.initState();
    getPost();
  }

  getPost() async {
    String api = Provider.of<Store>(context, listen: false).getApi();
    Post post = await ApiClient(Dio()).getPostById("Bearer ${api}", widget.id);

    setState(() {
      titleController = TextEditingController(text: post.title);
      textController = TextEditingController(text: post.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Post"),
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
                        "Edit Post",
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
                                width: MediaQuery.of(context).size.width * 0.3,
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
                                            widget.id,
                                            titleController.text,
                                            textController.text);
                                        Message mes = await ApiClient(Dio())
                                            .updatePostById("Bearer ${api}",
                                                post, widget.id);
                                        if (mes.status == true) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyApp()));
                                        }
                                      }
                                    },
                                    child: Text("Update"))),
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
