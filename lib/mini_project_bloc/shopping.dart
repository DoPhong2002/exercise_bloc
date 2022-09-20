import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingCubit() : super(ShoppingIniState());

  List<ItemShopping> listModel = [];
  List<ItemShopping> itemSelected = [];
  List<ItemShopping> listNameModel = [];

  void addListTodoAgain(List todo) {
    itemSelected = [];
    for (var i in todo) {
      itemSelected.add(i);
    }
    emit(ShoppingState());
  }

  List<ItemShopping> createListShopping() {
    if (listModel.isNotEmpty) {
      return listModel;
    }
    for (int i = 0; i < itemNames.length; i++) {
      listModel.add(
        ItemShopping(i, itemNames[i],
            Colors.primaries[Random().nextInt(Colors.primaries.length)], false),
      );
    }
    return listModel;
  }


  // List<ItemShopping> createListName() {
  //   for (int i = 0; i < itemNames.length; i++) {
  //     listNameModel.add(itemNames[i]);
  //   }
  //   return listNameModel;
  // }

  int countter() {
    int a = itemSelected.length;
    emit(ShoppingState());
    return a;
  }

  void setSwap(ItemShopping itemShopping) {
    itemShopping.setUp = true;
    emit(ShoppingState());
  }

  void setAgain(List<ItemShopping> item) {
    for (var obj in listModel) {
      for (var obk in item) {
        if (obj.name == obk.name) {
           obj.setUp = false;
        }
      }
    }
    emit(ShoppingState());
  }

  void removeCart(List itemShopping) {
    emit(ShoppingState());
  }

  List<String> itemNames = [
    'Gà KFC',
    'Trà sữa',
    'Vịt quay bắc kinh',
    'Sữa chua hạ long',
    'Gà ủ muối',
    'Bia Tiger',
    'Spaghetti',
    'Pizza',
    'Bánh mì hội an',
    'Phở thìn',
    'Chân gà',
    'Coffee',
    'Trà',
    'Xôi',
    'Cơm',
  ];
//
// void additemNew() {
//   itemNames.add()
// }

}

class ShoppingState {}

class ShoppingIniState extends ShoppingState {}

class ItemShopping {
  final int id;
  String name;
  final Color color;
  final int price = 42;
  bool setUp = false;

  ItemShopping(this.id, this.name, this.color, this.setUp);

// ItemShopping(this.id, this.name):color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
