import 'dart:convert';
import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitState());
  List<TodoModel> listTodoModel = [];
  SharedPreferences? sharedPreferences;

  Future createListTodo() async {
    // phat tin hieu dang xu ly
    emit(TodoGettingState());
    await Future.delayed(Duration(seconds: 2));
    //chuyen map ve model
    for (Map<String, dynamic> obj in jsonTodo) {
      TodoModel model = TodoModel(
        name: obj['Name'],
        timeNow: obj['TimeNow'],
        colors: obj['colors'],
      );
      //add model vao list
      listTodoModel.add(model);
    }
    // phat tin hieu den UI
    emit(TodoState());
  }

  //******Luu du lieu  local*******
  Future saveListTodo() async {
    List<String> listTodoDataString = [];
    for (TodoModel todoModel in listTodoModel) {
      // chuyen model ve map
      Map<String, dynamic> dataJson = Map<String, dynamic>();
      dataJson['Name'] = todoModel.name;
      dataJson['TimeNow'] = todoModel.timeNow;
      dataJson['colors'] = todoModel.colors;
      //b2: chuyen Map thanh String
      String listDataString = jsonEncode(dataJson);
      listTodoDataString.add(listDataString);
    }
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    sharedPreferences!.setStringList('dataTodo', listTodoDataString);
    print('test length: ${listTodoDataString.length}');
    // emit(TodoGettingState());
  }

  //******Lay  du lieu tu local*******
  Future getListTodoLocal() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    List<String>? dataListString = sharedPreferences!.getStringList('dataTodo');
    if (dataListString != null) {
      for (String obj in dataListString) {
        // chuyen String ve Map
        Map<String, dynamic>dataMap = jsonDecode(obj);
        // chuyen map ve Model
        TodoModel todoModel = TodoModel();
        todoModel.name =dataMap['Name'];
        todoModel.timeNow =dataMap['TimeNow'];
        todoModel.colors =dataMap['colors'];
        listTodoModel.add(todoModel);
      }
      print('du lieu lay ra: ${listTodoModel.length}');
    }
    emit(TodoGetSuccessState());
  }

  addTodo(String todo) async {
    // phat tin hieu dang xu ly
    emit(TodoGettingState());
    await Future.delayed(Duration(seconds: 2));
    listTodoModel.add(TodoModel(
        name: todo.toString(),
        timeNow: DateTime.now().toString(),
        colors: true));
    //phat tin hieu xu ly thanh cong
    saveListTodo();
    emit(TodoGettingState());
  }

  void removeTodo(TodoModel todo) {
    listTodoModel.remove(todo);
    saveListTodo();
    emit(TodoGettingState());
  }

  void setColor(TodoModel todo) {
    // todo.colors = !todo.colors;
    if(todo.colors == true){
      todo.colors == false;
    }else{
      todo.colors == true;
    }
    emit(TodoGettingState());
  }
}

class TodoState {}

class TodoInitState extends TodoState {}

class TodoGettingState extends TodoState {}

class TodoGetSuccessState extends TodoState {}

class TodoModel {
  String? name;
  String? timeNow;
  bool? colors = true ;

  TodoModel({ this.name,  this.timeNow,  this.colors});
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
