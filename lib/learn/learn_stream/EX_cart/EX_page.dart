import 'package:Flutter_father/learn/learn_stream/EX_cart/EX_bloc.dart';
import 'package:Flutter_father/learn/learn_stream/EX_cart/EX_page2.dart';
import 'package:Flutter_father/modun/navigator.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartPage'),
        actions: [
          IconButton(
            onPressed: () {
              navigatorPush(context, const EXPage2());
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              cart.addProduct('products');
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder<List<String>>(
          stream: cart.stream,
          builder: (context, snapshot) {
            return Center(
              child: Text('${cart.products.length ?? 0}'),
            );
          }),
    );
  }
}
