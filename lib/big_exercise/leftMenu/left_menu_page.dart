import 'package:flutter/material.dart';

import '../report/add_report_page.dart';

class LeftMenuPage extends StatefulWidget {
  const LeftMenuPage({Key? key}) : super(key: key);

  @override
  State<LeftMenuPage> createState() => _LeftMenuPageState();
}

class _LeftMenuPageState extends State<LeftMenuPage> {
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
          buildTitle(),
          buildListIcons()
        ],
      )
    );
  }

  Widget buildTitle() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.cyanAccent),
        ),
        Positioned(
          left:24,
          bottom: 24,
          child: Row(
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

  Widget buildListIcons(){
    return Column(
      children: [
        InkWell(
           onTap: (){
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
                SizedBox(width: 8,),
                Text('Report', style: TextStyle(
                  fontSize: 16
                ),)
              ],
            ),
          ),
        ),
        Container(height: 2,color: Colors.grey[300],),
        InkWell(
           onTap: (){},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.report, size: 32),
                SizedBox(width: 8,),
                Text('Báo cáo', style: TextStyle(
                  fontSize: 16
                ),)
              ],
            ),
          ),
        ),
        Container(height: 2,color: Colors.grey[300],),
        InkWell(
           onTap: (){},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.pan_tool_alt_sharp, size: 32),
                SizedBox(width: 8,),
                Text('Đổi mật khẩu', style: TextStyle(
                  fontSize: 16
                ),)
              ],
            ),
          ),
        ),
        Container(height: 2,color: Colors.grey[300],),
        InkWell(
           onTap: (){},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.rule_folder, size: 32),
                SizedBox(width: 8,),
                Text('Điều khoản', style: TextStyle(
                  fontSize: 16
                ),)
              ],
            ),
          ),
        ),
        Container(height: 2,color: Colors.grey[300],),
        InkWell(
           onTap: (){},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.phone, size: 32),
                SizedBox(width: 8,),
                Text('Liên hệ', style: TextStyle(
                  fontSize: 16
                ),)
              ],
            ),
          ),
        ),
        Container(height: 2,color: Colors.grey[300],),
        InkWell(
           onTap: (){},
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.logout, size: 32),
                SizedBox(width: 8,),
                Text('Đăng xuất', style: TextStyle(
                  fontSize: 16
                ),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
