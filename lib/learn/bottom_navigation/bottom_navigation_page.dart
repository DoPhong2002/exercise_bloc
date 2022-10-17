import 'package:flutter/material.dart';

class LearnBottomNavigationBar extends StatefulWidget {
  const LearnBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<LearnBottomNavigationBar> createState() =>
      _LearnBottomNavigationBarState();
}

class _LearnBottomNavigationBarState extends State<LearnBottomNavigationBar> with SingleTickerProviderStateMixin{
  int currentIndex = 0;
  late TabController controller;
  final pages = <Widget>[];
  @override
  void initState() {
    pages.addAll([
      Container(
        color: Colors.white,
      ),
      Container(
        color: Colors.grey,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.green,
      ),

    ]);
    controller  = TabController(length: getItems().length, vsync: this);
    controller.addListener(onChange);
     super.initState();
  }
  @override
  void dispose() {
    controller.removeListener(onChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      // body: IndexedStack(
      //   index: currentIndex,
      //   children: pages,
      // ),
      // body: TabBarView(
      //   controller: controller,
      //   children: pages,
      // ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      items: getItems(),
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          controller.animateTo(index);
        });
      },
    );
  }



  List<BottomNavigationBarItem> getItems() {
    return [
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_account.png'),
        activeIcon: Image.asset('assets/icons/tab_account_on.png'),
        label: 'Account',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_history.png'),
        activeIcon: Image.asset('assets/icons/tab_history_on.png'),
        label: 'Car',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_home.png'),
        activeIcon: Image.asset('assets/icons/tab_home_on.png'),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_notify.png'),
        activeIcon: Image.asset('assets/icons/tab_notify_on.png'),
        label: 'Notification',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_home.png'),
        activeIcon: Image.asset('assets/icons/tab_home_on.png'),
        label: 'Home 2',
      )
    ];
  }
  void onChange( ){
    setState(() {
      currentIndex = controller.index;
    });
  }
}
