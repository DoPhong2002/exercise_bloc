import 'package:Flutter_father/MyTextField.dart';
import 'package:Flutter_father/big_exercise/modun/Mybuttom.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Image.network(
                        'https://photo-cms-sggp.zadn.vn/w580/Uploaded/2022/yfsgf/2019_06_20/lazadamasterlogo_esvv.png'),
                    const MyTextField(
                      labelText: 'Số điện thoại',
                      hintText: '0867..',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const MyTextField(
                      labelText: 'Password',
                      hintText: 'pass',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyButton(
                            textButtom: 'Hủy',
                            colorButton: Colors.white,
                            colorTextButton: Colors.black,
                            onTapButtom: () {
                              print('cancel');
                            },
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          child: MyButton(
                            textButtom: 'Đăng nhập',
                            colorButton: Colors.cyanAccent,
                            colorTextButton: Colors.white,
                            onTapButtom: () {
                              print('login');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'HotLine: ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      '1800.1186',
                      style: TextStyle(color: Colors.cyanAccent),
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget boxStyle() {
  return Container(
    width: 60,
    height: 60,
    color: Colors.red,
  );
}
