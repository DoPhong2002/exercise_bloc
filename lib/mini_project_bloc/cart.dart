import 'dart:ui';

import 'package:Flutter_father/mini_project_bloc/shopping.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitState());
  List<ItemShopping> listCart = [];

  void cartSelected(List todo) {
    for (var i in todo) {
      listCart.add(i);
    }
    emit(CartState());
  }

  void removeCart(ItemShopping itemShopping) {
    listCart.remove(itemShopping);
    itemShopping.setUp = false;
    emit(CartState());
  }

  int lili() {
    int a = listCart.length * 42;
    emit(CartState());
    return a;
  }
}

class CartState {}

class CartInitState extends CartState {}
