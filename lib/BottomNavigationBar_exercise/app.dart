import 'package:Flutter_father/BottomNavigationBar_exercise/cart_page.dart';
import 'package:Flutter_father/BottomNavigationBar_exercise/product_page.dart';
import 'package:flutter/material.dart';

class AppCount extends StatefulWidget {
  const AppCount({Key? key}) : super(key: key);

  @override
  State<AppCount> createState() => _AppCountState();
}

class _AppCountState extends State<AppCount> {
  final items = <BottomNavigationBarItem>[];
  final pages = <Widget>[];
  int currentIndex = 0;

  @override
  void initState() {
    items.addAll([
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_box),
        label: 'Accout',
      ),
    ]);
    pages.addAll([
      const ProductPage(),
      const CartPage(),
    ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        selectedItemColor: Colors.cyan,
        onTap: (index) {
        setState(
              () {
            currentIndex = index;
          },
        );
      },

      ),
    );
  }
}
