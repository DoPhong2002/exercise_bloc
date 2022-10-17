import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> listTodoModels = [];
  SharedPreferences? _preferences;

  void setUp() {
    notifyListeners();
  }

  addTodo(String todo) async {
    listTodoModels.add(
      TodoModel(
        name: todo.toString(),
        timeNow: DateTime.now().millisecondsSinceEpoch,
      ),
    );
    saveListTodoLocal();
    notifyListeners();
  }

  removeTodo(TodoModel todoModel) {
    listTodoModels
        .removeWhere((element) => element.timeNow == todoModel.timeNow);
    saveListTodoLocal();
    notifyListeners();
  }

  void saveListTodoLocal() async {
    List<String> listTodoLocal = [];
    // chuyen model ve map
    Map<String, dynamic> todoJson = Map();
    for (TodoModel todoModel in listTodoModels) {
      todoJson['Name'] = todoModel.name;
      todoJson['TimeNow'] = todoModel.timeNow;
      //b2: chuyen Map thanh String
      String listData = jsonEncode(todoJson);
      listTodoLocal.add(listData);
    }
    //luu String duoi dang Ki
    _preferences ??= await SharedPreferences.getInstance();
    _preferences!.setStringList('dataTodo', listTodoLocal);
    print('test length: ${listTodoLocal.length}');
  }

  ////***Lay du lieu tu local****
  void getListTodoLocal() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    List<String>? listDataTodoLocal = _preferences!.getStringList('dataTodo');
    //Tao vong lap
    for (String todo in listDataTodoLocal!) {
      // chuyen String ve Map
      Map<String, dynamic> dataTodoLocalMap = jsonDecode(todo);
      //chuyen Map ve Model
      TodoModel todoModel = TodoModel();
      todoModel.name = dataTodoLocalMap['Name'];
      todoModel.timeNow = dataTodoLocalMap['TimeNow'];
      listTodoModels.add(todoModel);
    }
    notifyListeners();
  }
}

class TodoModel {
  String? name;
  int? timeNow;

  TodoModel({this.name, this.timeNow});
}

// const jsonTodo = [
//   {
//     "Name": "Cong viec 1",
//     "TimeNow": 'con cu',
//     "colors": true,
//   },
//   {
//     "Name": "3",
//     "TimeNow": "4",
//     "colors": true,
//   },
//   {
//     "Name": "5",
//     "TimeNow": "6",
//     "colors": true,
//   },
// ];

/*
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

  //Luu du lieu  local*******
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

  //Lay  du lieu tu local*******
  Future getListTodoLocal() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    List<String>? dataListString = sharedPreferences!.getStringList('dataTodo');
    if (dataListString != null) {
      for (String obj in dataListString) {
        // chuyen String ve Map
        Map<String, dynamic> dataMap = jsonDecode(obj);
        // chuyen map ve Model
        TodoModel todoModel = TodoModel();
        todoModel.name = dataMap['Name'];
        todoModel.timeNow = dataMap['TimeNow'];
        todoModel.colors = dataMap['colors'];
        listTodoModel.add(todoModel);
      }
      print('du lieu lay ra: ${listTodoModel.length}');
    }
    emit(TodoGetSuccessState());
  }



  void removeTodo(TodoModel todo) {
    listTodoModel.remove(todo);
    saveListTodo();
    emit(TodoGettingState());
  }

 */
