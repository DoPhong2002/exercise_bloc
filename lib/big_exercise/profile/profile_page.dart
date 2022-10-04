import 'package:Flutter_father/big_exercise/modun/Mybuttom.dart';
import 'package:Flutter_father/big_exercise/login/model_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../MyTextField.dart';
import '../modun/confirmDialog.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Tài khoản',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            buildAvt(),
            const SizedBox(
              height: 32,
            ),
            buildTextFields(),
            const SizedBox(
              height: 32,
            ),
            MyButton(
                textButtom: 'Lưu',
                colorButton: Colors.cyanAccent,
                colorTextButton: Colors.white,
                onTapButtom: () {})
          ],
        ),
      ),
    );
  }

  Widget buildAvt() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: Image.network(
              'https://i.pinimg.com/550x/6f/22/ef/6f22ef54db441c9734775235dff701f6.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          right: -10,
          child: IconButton(
            onPressed: () {
              showConfirmDialog(
                context: context,
                title: 'Ảnh đại diện',
                message: 'Bạn muốn thay đổi?',
                confirm: 'Ok',
                unConfirm: 'Ko',
                onConfirm: () {
                  print('chim non');
                },
              );
            },
            icon: const Icon(
              Icons.camera_alt,
              color: Colors.cyanAccent,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTextFields() {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        MyTextField(labelText: 'Họ & tên'),
        MyTextField(
          labelText: 'Ngày sinh',
          keyboardType: TextInputType.datetime,
        ),
        MyTextField(labelText: 'Địa chỉ'),
        MyTextField(
          labelText: 'Số điện thoại',
          keyboardType: TextInputType.number,
        ),
        MyTextField(
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  void showdialogAvt() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.grey.withOpacity(0.2),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (_, __, ___) {
        return Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: MyAvtDialog(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  width: 300,
                  height: 150,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Thay đổi ảnh đại diện',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Huy')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Yes')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyAvtDialog extends StatefulWidget {
  final Widget child;

  const MyAvtDialog({super.key, required this.child});

  @override
  State<MyAvtDialog> createState() => _MyAvtDialogState();
}

class _MyAvtDialogState extends State<MyAvtDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
