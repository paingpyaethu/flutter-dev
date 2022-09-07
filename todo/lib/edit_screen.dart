import 'package:flutter/material.dart';
import 'package:todo/db/todo.dart';
import 'package:todo/db/todo_dao.dart';
import 'package:todo/db/todo_database.dart';

class EditScreen extends StatefulWidget {
  int id;
  EditScreen(this.id);
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late final database;
  late TodoDao todoDao;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    getConnection();
  }

  getConnection() async {
    this.database =
        await $FloorTodoDatabase.databaseBuilder("todo_database.db").build();
    this.todoDao = database.todoDao;

    Todo? todo = await this.todoDao.findTodoById(widget.id);
    setState(() {
      this.controller = TextEditingController(text: todo!.task);
    });
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          "Edit Screen",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Form(
            key: key,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        hintText: "Enter Something", labelText: "To Do List"),
                  )
                ],
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  backgroundColor: Colors.orange,
                  textStyle: TextStyle(
                    fontSize: 16,
                  )),
              onPressed: () async {
                setState(() {
                  this.todoDao.updateById(widget.id, controller.text);
                  Navigator.pop(context);
                });
              },
              child: Text("Update")),
        ),
      ]),
    );
  }
}
