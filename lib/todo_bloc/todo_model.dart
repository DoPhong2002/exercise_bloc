import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnew/mini_project_bloc/shopping.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitState());
  List<TodoModel> listTodoModel = [];
  void createListTodo() {
    //tao du lieu
    for (Map<String, dynamic> obj in jsonTodo) {
      TodoModel model = TodoModel(
        name: obj['Name'],
        timeNow: obj['TimeNow'],
        colors: obj['colors'],
      );
      listTodoModel.add(model);
    }
    // phat tin hieu den UI
    emit(TodoState());
  }
  void addTodo(String todo){
    listTodoModel.add(TodoModel(name: todo.toString(), timeNow: DateTime.now().toString(), colors: true));
    emit(TodoState());
  }

  void removeTodo(TodoModel todo) {

    listTodoModel.remove(todo);
    emit(TodoState());
  }

  void setColor(TodoModel todo){
    todo.colors= !todo.colors;
    emit(TodoState());
  }
}

class TodoState {}

class TodoInitState extends TodoState {}

class TodoModel {
  String name;
  String timeNow;
  bool colors = true;

  TodoModel({required this.name, required this.timeNow, required this.colors});
}

const jsonTodo = [
  {
    "Name": "Cong viec 1",
    "TimeNow": 'con cu',
    "colors": true,
  },
  {
    "Name": "3",
    "TimeNow": "4",
    "colors": true,
  },
  {
    "Name": "5",
    "TimeNow": "6",
    "colors": true,
  },
];
