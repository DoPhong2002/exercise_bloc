import 'dart:async';

///singleton
class CartBloc {
  static final _cart = CartBloc.internal();

  factory CartBloc() => _cart;

  CartBloc.internal();

  final products = <String>[];

  ///Them broadcast()  để có thể nhiều thằng có thể Stream được nó!
  final _streamController = StreamController<List<String>>.broadcast();

  Stream<List<String>> get stream => _streamController.stream;

  void addProduct(String product) {
    products.add(product);
    _streamController.add(products);
  }
}

final cart = CartBloc();
