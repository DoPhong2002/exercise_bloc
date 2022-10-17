import 'package:Flutter_father/MyTextField.dart';
import 'package:Flutter_father/exercise/big_exercise/add_report/add_report_page.dart';
import 'package:Flutter_father/exercise/big_exercise/left_menu_page.dart';
import 'package:Flutter_father/exercise/big_exercise/profile_page.dart';
import 'package:Flutter_father/exercise/big_exercise/register_page.dart';
import 'package:Flutter_father/exercise/big_exercise/report_model.dart';
import 'package:Flutter_father/learn/learn_save_data/hive/hive_manager.dart';
import 'package:Flutter_father/learn/learn_secure_storage/flutter_secure_storage.dart';
import 'package:Flutter_father/modun/progress_dialog.dart';
import 'package:Flutter_father/modun/service/api_service.dart';
import 'package:Flutter_father/modun/service/user_service.dart';
import 'package:Flutter_father/modun/shared_preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../modun/Mybuttom.dart';
import '../../modun/navigator.dart';
import '../../modun/toast_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  var notifier = ValueNotifier<bool>(false);
  late ProgressDialog progress;

  @override
  void initState() {
    // phoneController.text = '12344';
    progress = ProgressDialog(context);

    // sharedPrefs.getString(phoneKey).then((value) {
    //   phoneController.text = value ?? '';
    // });
    secureStorage.getString(phoneKey).then((value) {
      phoneController.text = value ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BigCubit>(context);
    print('${cubit.isEnable}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {},
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Image.network(
                        'https://photo-cms-sggp.zadn.vn/w580/Uploaded/2022/yfsgf/2019_06_20/lazadamasterlogo_esvv.png',
                        width: 188,
                      ),
                      MyTextField(
                        controller: phoneController,
                        labelText: 'Số điện thoại',
                        hintText: '0867..',
                        keyboardType: TextInputType.number,
                        onChanged: (_) => valadate(
                            phoneController.text, passwordController.text),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MyTextField(
                        controller: passwordController,
                        labelText: 'Password',
                        hintText: 'pass',
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (_) => valadate(
                            phoneController.text, passwordController.text),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              text: 'Register',
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              onTap: () {
                                navigatorPush(context, const RegisterPage());
                                // print('cancel');
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: ValueListenableBuilder<bool>(
                              valueListenable: notifier,
                              builder: (context, value, _) {
                                return MyButton(
                                  text: 'Login',
                                  backgroundColor: Colors.cyanAccent,
                                  textColor: Colors.white,
                                  enable: value,
                                  onTap: () {
                                    buildLogin();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'HotLine: ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    '1800.1186',
                    style: TextStyle(color: Colors.cyanAccent),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void valadate(String string1, String string2) {
    if (string1.isNotEmpty && string2.isNotEmpty) {
      notifier.value = true;
    } else {
      notifier.value = false;
    }
  }

  void buildLogin() async {
    progress.show();
    await Future.delayed(Duration(seconds: 3));
    apiService
        .login(phone: phoneController.text, password: passwordController.text)
        .then((user) {
          // sharedPrefs.setString(phoneKey, phoneController.text);
          secureStorage.setString(phoneKey, phoneController.text);
          // hive.setValue(userTokeKey, user.token);
          hive.setValue(userKey, user);

      progress.hide();

      ToastOverlay(context)
          .show(message: 'Hello ${user.name}', type: ToastType.error);
      apiService.token = user.token ?? '';
      navigatorPushAndRemoveUntil(context, LeftMenuPage());
    }).catchError((e) {
      progress.hide();
      ToastOverlay(context).show(message: e.toString(), type: ToastType.error);
    });
  }

  void resgister() {}

  void login() {}
}
