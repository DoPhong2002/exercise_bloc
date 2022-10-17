import 'dart:convert';
import 'package:Flutter_father/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../modun/Mybuttom.dart';
import '../../modun/navigator.dart';
import '../../modun/toast_overlay.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // const SizedBox(height: 64,),
            Image.network(
              'https://photo-cms-sggp.zadn.vn/w580/Uploaded/2022/yfsgf/2019_06_20/lazadamasterlogo_esvv.png',
              width: 188,
            ),
            MyTextField(
              labelText: 'Name',
              controller: nameController,
            ),
            MyTextField(controller: phoneController, labelText: 'Phone Number'),
            MyTextField(
              controller: emailController,
              labelText: 'Email',
            ),
            MyTextField(
              controller: addressController,
              labelText: 'Address',
            ),
            MyTextField(
              controller: passwordController,
              labelText: 'PassWord',
            ),
            SizedBox(
              height: 64,
            ),
            Row(
              children: [
                Expanded(
                  child: MyButton(
                    text: 'Cancel',
                    backgroundColor: Colors.white,
                    textColor: Colors.cyanAccent,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: MyButton(
                    text: 'Register',
                    backgroundColor: Colors.cyanAccent,
                    textColor: Colors.white,
                    onTap: () {
                      apiRegister();
                      // ToastOverlay(context).show(message: 'Dang ki thanh cong');
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future apiRegister() async {
    final uri = Uri.parse('http://api.quynhtao.com/api/accounts/register');

    final parameters = {
      "PhoneNumber": phoneController.text,
      "Name": nameController.text,
      "Address": addressController.text,
      "Password": passwordController.text,
      "Email": emailController.text,
    };
    final response = await http.post(
      uri,
      body: parameters,
      encoding: utf8,
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);
      if (json['code'] == 0) {
        ToastOverlay(context).show(message: 'Ok', type: ToastType.error);
        navigatorPushAndRemoveUntil(context, LoginPage());
      } else {
        return ToastOverlay(context)
            .show(message: 'Số điện thoại đã được đăng ký roi nha :3', type: ToastType.error);
      }
    }
    throw Exception('Có lỗi xảy ra, http status code: ${response.statusCode}');
  }
}
