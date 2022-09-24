import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnew/mini_project_bloc/shopping.dart';

import '../Archive/navigator.dart';
import 'mini_shopping_page_2.dart';

class MiniShoppingPage1 extends StatefulWidget {
  const MiniShoppingPage1({Key? key}) : super(key: key);

  @override
  State<MiniShoppingPage1> createState() => _MiniShoppingPage1State();
}

class _MiniShoppingPage1State extends State<MiniShoppingPage1> {
  final ShoppingCubit _shoppingCubit = ShoppingCubit();

  @override
  void initState() {
    _shoppingCubit.createListShopping();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Danh muc'),
            Stack(
              alignment: Alignment.topRight,
              children: [
                buildBloc(),
                Container(
                  alignment: Alignment.center,
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: BlocBuilder<ShoppingCubit, ShoppingState>(
                    bloc: _shoppingCubit,
                    builder: (BuildContext, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _shoppingCubit.countter().toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: buildListItemShopping(),
    );
  }

  Widget buildBloc(){
    return BlocBuilder<ShoppingCubit, ShoppingState>(
      bloc: _shoppingCubit,
      builder: (BuildContext, state) {
        return IconButton(
          onPressed: () async {
            final listLeak = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MiniShoppingPage2(
                    listBuy: _shoppingCubit.itemSelected),
              ),
            );
            print('truoc khi: ${_shoppingCubit.itemSelected.length}');
            _shoppingCubit.addListTodoAgain(listLeak);
            print('sau khi: ${_shoppingCubit.itemSelected.length}');
          },
          icon: const Icon(Icons.shopping_cart, size: 32),
        );
      },
    );
  }

  Widget buildItemShopping(ItemShopping itemShopping) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            color: itemShopping.color,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(itemShopping.name),
          ),
          BlocBuilder<ShoppingCubit, ShoppingState>(
            bloc: _shoppingCubit,
            builder: (BuildContext, state) {
              return GestureDetector(
                onTap: () {
                  _shoppingCubit.setSwap(itemShopping);
                  // print(itemShopping.name);
                  final countt = (_shoppingCubit.itemSelected
                      .where((item) => item.name == itemShopping.name)).length;
                  if (countt == 0) {
                    _shoppingCubit.itemSelected.add(itemShopping);
                  }
                },
                child: itemShopping.setUp
                    ? Icon(Icons.check)
                    : Text('Thêm'),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildListItemShopping() {
    return ListView.separated(
      itemBuilder: (_, index) {
        final todo = _shoppingCubit.listModel[index];
        return buildItemShopping(todo);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 12,
        );
      },
      itemCount: _shoppingCubit.listModel.length,
    );
  }

  Widget iconTick() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_downward_outlined),
    );
  }
}
