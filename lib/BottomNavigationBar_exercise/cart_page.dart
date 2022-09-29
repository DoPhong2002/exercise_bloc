import 'package:Flutter_father/BottomNavigationBar_exercise/bottom_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final countCubit = BlocProvider.of<CountCubit>(context);

    return Scaffold(
      body: Center(
          child: Center(
        child: Container(
          height: 60,
          width: 60,
          child: Text(
            '${countCubit.count}',
            style: TextStyle(fontSize: 40),
          ),
        ),
      )),
    );
  }
}
