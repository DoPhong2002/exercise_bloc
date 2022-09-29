import 'package:Flutter_father/mini_project_bloc/cart.dart';
import 'package:Flutter_father/mini_project_bloc/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MiniShoppingPage2 extends StatefulWidget {
  List<ItemShopping> listBuy = [];

  MiniShoppingPage2({super.key, required this.listBuy});

  @override
  State<MiniShoppingPage2> createState() => _MiniShoppingPage2State();
}

class _MiniShoppingPage2State extends State<MiniShoppingPage2> {
  final CartCubit _cubit = CartCubit();

  @override
  void initState() {
    _cubit.cartSelected(widget.listBuy);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
          },
          child: Row(
            children: const [
              Text('Cart'),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context, _cubit.listCart);
            // Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: buildListCart(),
          ),
          Expanded(
            flex: 1,
            child: buildPay(),
          )
        ],
      ),
    );
  }

  Widget cart(ItemShopping itemShopping) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          const Icon(
            Icons.airline_stops,
          ),
          const SizedBox(
            width: 40,
          ),
          Expanded(
            child: Text(
              itemShopping.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              print(itemShopping);
              _cubit.removeCart(itemShopping);
            },
          ),
        ],
      ),
    );
  }

  Widget buildPay() {
    return BlocBuilder<CartCubit, CartState>(
      bloc: _cubit,
      builder: (BuildContext, state) {
        return SizedBox(
          height: 200,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$ ${_cubit.lili()}",
                style: const TextStyle(
                  color: Colors.grey,
                  // fontWeight: FontWeight.w100,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Buy',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildListCart() {
    return BlocBuilder<CartCubit, CartState>(
      bloc: _cubit,
      builder: (BuildContext, state) {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final todo = _cubit.listCart[index];
            return cart(todo);
          },
          separatorBuilder: (BuildContext, index) {
            return const SizedBox(
              height: 30,
            );
          },
          itemCount: _cubit.listCart.length,
        );
      },
    );
  }
}
