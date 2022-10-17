import 'package:Flutter_father/exercise/big_exercise/profile_page.dart';
import 'package:Flutter_father/exercise/big_exercise/stream/stream_ex.dart';
import 'package:Flutter_father/learn/learn_save_data/hive/hive_manager.dart';
import 'package:flutter/material.dart';

import '../../modun/navigator.dart';
import 'add_report/add_report_page.dart';
import 'login_page.dart';

class LeftMenuPage extends StatefulWidget {
  const LeftMenuPage({Key? key}) : super(key: key);

  @override
  State<LeftMenuPage> createState() => _LeftMenuPageState();
}

class _LeftMenuPageState extends State<LeftMenuPage> {
  late EXBloc bloc;

  @override
  void initState() {
    bloc = EXBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LeftMenu')),
      drawer: buildDrawer(),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              navigatorPush(context, const Profile());
            },
            child: buildTitle(),
          ),
          buildListIcons(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Stack(
      children: [
        Image.network(
          'https://taoanhdep.com/wp-content/uploads/2022/08/hinh-nen-may-cuc-dep-350x265.jpeg',
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 24,
          bottom: 24,
          child: Row(
            children: [
              StreamBuilder<String>(
                stream: bloc.EXstream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(bloc.url,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Image.asset(
                        'assets/icons/dog2.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Đỗ Hồng Phong'),
                  Text('0867997034'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildListIcons() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddReportPage()),
            );
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.menu, size: 32),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Report',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 2,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.report, size: 32),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Báo cáo',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 2,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.pan_tool_alt_sharp, size: 32),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Đổi mật khẩu',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 2,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.rule_folder, size: 32),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Điều khoản',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 2,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.phone, size: 32),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Liên hệ',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 2,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: () {
            logOut();
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.logout, size: 32),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Đăng xuất',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void logOut() {
    hive.removeValue();
    print('da remove');
    navigatorPushAndRemoveUntil(context, const LoginPage());
  }
}
