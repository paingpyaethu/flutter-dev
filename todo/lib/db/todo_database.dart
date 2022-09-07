import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
// import 'package:todo/db/todo.dart';
import 'todo.dart';
import 'package:todo/db/todo_dao.dart';
part 'todo_database.g.dart';

@Database(version: 1, entities: [Todo])
abstract class TodoDatabase extends FloorDatabase {
  TodoDao get todoDao;
}
