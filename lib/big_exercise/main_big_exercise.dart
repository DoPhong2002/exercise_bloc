import 'package:Flutter_father/big_exercise/login/login_page.dart';
import 'package:Flutter_father/big_exercise/profile/profile_page.dart';
import 'package:Flutter_father/big_exercise/newsfeed/newfeed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'leftMenu/left_menu_page.dart';
import 'login/model_login.dart';
import 'newsfeed/newfeed_model.dart';
import 'report/report_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewFeedCubit>(
      create: (_) => NewFeedCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        ),
        home: ReportPage(),
      ),
    );
  }
}