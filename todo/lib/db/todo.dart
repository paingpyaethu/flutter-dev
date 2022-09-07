import 'package:floor/floor.dart';

@entity
class Todo {
  @primaryKey
  int id;
  String task;
  Todo(this.id, this.task);
}
