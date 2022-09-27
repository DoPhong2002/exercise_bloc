import 'package:flutter/material.dart';
import 'package:newnew/todo_bloc/todo_model.dart';
import 'package:newnew/todo_bloc/todo_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => TodoProvider(),
        child: TodoPage(),
      ),
    ),
  );
}
