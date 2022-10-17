import 'package:Flutter_father/learn/learn_stream/EX_cart/EX_bloc.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
   List<String> a = [];
   late int b =  1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartPage'),
        actions: [IconButton(onPressed: () {
          cart.addProduct(TestModel('',a ,b));
        }, icon: const Icon(Icons.add))],
      ),
      body: StreamBuilder<TestModel>(
          stream: cart.stream,
          builder: (context, snapshot) {
            return Center(child:Text('${snapshot.data?.listString.length ?? 0}'));
          }),
    );
  }
}
