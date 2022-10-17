import 'package:flutter/material.dart';

import 'bottom_navigation_page.dart';

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow
      ),
      home: LearnBottomNavigationBar(),
    )
  );
}