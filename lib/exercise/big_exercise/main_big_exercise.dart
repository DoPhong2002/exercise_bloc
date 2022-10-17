import 'package:Flutter_father/exercise/big_exercise/add_report/add_report_page.dart';
import 'package:Flutter_father/exercise/big_exercise/profile_page.dart';
import 'package:Flutter_father/exercise/big_exercise/report_model.dart';
import 'package:Flutter_father/exercise/big_exercise/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modun/splash_page.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BigCubit>(
      create: (_) => BigCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: SplashPage(),
      ),
    );
  }
}
