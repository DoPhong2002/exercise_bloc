import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin{
  late TabController controller;
  final items = <Widget>[];
  final pages = <Widget>[];
  int currentIndex = 0;
  @override
  void initState() {
    items.addAll([
      Text('Tat ca'),
      Text('Chuyen di'),
      Text('Giao dich'),
      Text('Tin tuc'),
    ]);

    pages.addAll([
      Container(color: Colors.white,),
      Container(color: Colors.blue,),
      Container(color: Colors.black,),
      Container(color: Colors.green,),
    ]);
    controller = TabController(length: items.length, vsync: this);
    // controller.addListener(() {
    //   setState(() {
    //
    //   });
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Su pro coder'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildTabBar(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildTabBar(){
    return Container(
      height: 40,
      child: TabBar(
        controller: controller,
        tabs: items,
        labelColor: Colors.green,
        isScrollable: true,
      ),
    );
  }

  Widget buildBody(){
    return Expanded(
      child: Container(
        child: TabBarView(
          controller: controller,
          children:pages,
        ),
      ),
    );
  }
}
