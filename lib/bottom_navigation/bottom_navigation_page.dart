import 'package:Flutter_father/mini_project_bloc/mini_shopping_page_1.dart';
import 'package:Flutter_father/todo_bloc/todo_page.dart';
import 'package:flutter/material.dart';

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  final items = <BottomNavigationBarItem>[];
  final pages = <Widget>[];
  int currentIndex = 0;

  @override
  void initState() {
    items.addAll([
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_account.png'),
        activeIcon: Image.asset('assets/icons/tab_account_on.png'),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_history.png'),
        activeIcon: Image.asset('assets/icons/tab_history_on.png'),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_home.png'),
        activeIcon: Image.asset('assets/icons/tab_home_on.png'),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_notify.png'),
        activeIcon: Image.asset('assets/icons/tab_notify_on.png'),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('assets/icons/tab_home.png'),
        activeIcon: Image.asset('assets/icons/tab_home_on.png'),
        label: 'Home',
      )
    ]);
    pages.addAll([
      const MiniShoppingPage1(),
      const TodoPage(),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.red,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
        selectedLabelStyle: const TextStyle(color: Colors.green),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
