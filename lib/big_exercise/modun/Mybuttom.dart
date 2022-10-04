import 'package:Flutter_father/big_exercise/login/model_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  final String textButtom;
  final Color colorButton;
  final Color colorTextButton;
  final VoidCallback onTapButtom;

  const MyButton(
      {super.key,
      required this.textButtom,
      required this.colorButton,
      required this.colorTextButton,
      required this.onTapButtom});

  @override
  Widget build(BuildContext context) {
    final _cubitProduct = LoginCubit();
    return BlocBuilder(
      bloc: _cubitProduct,
      builder: (_,index) {
        return InkWell(
          onTap: () {
            onTapButtom();
            _cubitProduct.lockSelect();
            print('con chim non');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _cubitProduct.state.select ? colorButton : Colors.grey),
            child: Text(
              textButtom,
              style: TextStyle(
                color: colorTextButton,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
