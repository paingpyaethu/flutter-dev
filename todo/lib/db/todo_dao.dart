import 'package:floor/floor.dart';
import 'package:todo/db/todo.dart';

@dao
abstract class TodoDao {
  @insert
  Future<void> insertTodo(Todo todo);

  @Query("SELECT * FROM Todo")
  Stream<List<Todo>> findAllTodo();

  @Query("SELECT * FROM Todo ORDER BY id DESC LIMIT 1")
  Future<Todo?> findTodoLast();

  @Query("DELETE FROM Todo WHERE id = :id")
  Future<void> deleteById(int id);

  @Query("SELECT * FROM Todo WHERE id = :id")
  Future<Todo?> findTodoById(int id);

  @Query("UPDATE Todo SET task = :task WHERE id = :id ")
  Future<void> updateById(int id, String task);

  @Query("DELETE FROM Todo")
  Future<void> deleteAll();
}
