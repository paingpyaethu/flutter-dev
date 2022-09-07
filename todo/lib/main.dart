import 'package:flutter/material.dart';
import 'package:todo/db/todo.dart';
import 'package:todo/db/todo_dao.dart';
import 'package:todo/db/todo_database.dart';
import 'package:todo/edit_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late final database;
  late TodoDao todoDao;
  int lastId = 1;

  @override
  void initState() {
    super.initState();
    getConnection();
  }

  getConnection() async {
    database =
        await $FloorTodoDatabase.databaseBuilder("todo_database.db").build();
    setState(() {
      todoDao = database.todoDao;
    });
  }

  add(int id, String task) {
    this.todoDao.insertTodo(Todo(id, task));
  }

  getLastId() async {
    Todo? todo = await this.todoDao.findTodoLast();
    setState(() {
      if (todo != null) {
        lastId = todo.id + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              this.todoDao.deleteAll();
            });
          },
          child: Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: Text(
            "To Do List",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Form(
                key: key,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: "Enter Something",
                            labelText: "To Do List"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Must not be empty!";
                          }
                          return null;
                        },
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
                    if (key.currentState!.validate()) {
                      String result = controller.text;
                      await getLastId();
                      add(this.lastId, result);
                    }
                  },
                  child: Text("Save")),
            ),
            Expanded(
                child: StreamBuilder<List<Todo>>(
              stream: this.todoDao.findAllTodo(),
              builder: (context, AsyncSnapshot snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Text("${snapshot.data[index].task}"),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return EditScreen(snapshot.data[index].id);
                              })));
                            },
                            icon: Icon(Icons.edit),
                            color: Colors.orange,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                this
                                    .todoDao
                                    .deleteById(snapshot.data[index].id);
                              });
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ]),
                      );
                    });
              },
            )),
          ],
        ));
  }
}
