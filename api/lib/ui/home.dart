import 'package:api/auth/api_client.dart';
import 'package:api/auth/store.dart';
import 'package:api/main.dart';
import 'package:api/models/message.dart';
import 'package:api/models/post.dart';
import 'package:api/ui/add_post.dart';
import 'package:api/ui/edit_post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    String api = Provider.of<Store>(context).getApi();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPost()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
          child: StreamBuilder<List<Post>>(
              stream: ApiClient(Dio()).getAllPosts("Bearer ${api}"),
              builder: (context, AsyncSnapshot<List<Post>> snapshot) =>
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 80,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      "${snapshot.data![index].title}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditPost(snapshot
                                                            .data![index].id)));
                                          }),
                                          child: Icon(Icons.edit)),
                                      TextButton(
                                          onPressed: (() async {
                                            String api = Provider.of<Store>(
                                                    context,
                                                    listen: false)
                                                .getApi();
                                            Message mes = await ApiClient(Dio())
                                                .deletePostById("Bearer ${api}",
                                                    snapshot.data![index].id);
                                            if (mes.status == true) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyApp()));
                                            }
                                          }),
                                          child: Icon(Icons.delete_rounded)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )))),
    );
  }
}
