import 'package:Flutter_father/exercise/big_exercise/left_menu_page.dart';
import 'package:Flutter_father/exercise/big_exercise/login_page.dart';
import 'package:Flutter_father/exercise/big_exercise/user.dart';
import 'package:Flutter_father/learn/learn_save_data/hive/hive_manager.dart';
import 'package:Flutter_father/learn/learn_save_data/secure_storage/flutter_secure_storage.dart';
import 'package:Flutter_father/modun/navigator.dart';
import 'package:Flutter_father/modun/shared_preferences_manager.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: FlutterLogo(
        size: 100,
      )),
    );
  }

  Future initData() async {
    await sharedPrefs.init();
    await secureStorage.init();
    await hive.init();

    final userJson = await hive.getValue(userKey);
    if (userJson != null) {
      final user = User.fromJson(userJson);
      print(user.name);
      navigatorPushAndRemoveUntil(context,  LeftMenuPage());
      print(user.token);
    } else {
      navigatorPushAndRemoveUntil(context,  LoginPage());
      print('splash');
    }
  }
}
