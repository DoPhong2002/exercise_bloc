
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottom_navigation/bottom_navigation_page.dart';
import 'app.dart';
import 'bottom_model.dart';
import 'cart_page.dart';

void main() {
  runApp(
    BlocProvider<CountCubit>(
      create: (_)=> CountCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppCount(),
      ),
    ),
  );

}
