import 'package:Flutter_father/tabbar/tabbar_page.dart';
import 'package:Flutter_father/todo_bloc/todo_model.dart';
import 'package:Flutter_father/todo_bloc/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation/bottom_navigation_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => TodoProvider(),
        child: LearnBottomNavigationBar(),
      ),
    ),
  );
}
