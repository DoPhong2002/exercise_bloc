import 'dart:async';

///Test ko tham khao
///singleton
class CartBloc {
  static final _cart = CartBloc.internal();

  factory CartBloc() => _cart;
  var token = "";

  CartBloc.internal();

  final products = <TestModel>[];

  final _streamController = StreamController<TestModel>.broadcast();///Them broadcast()  để có thể nhiều thằng có thể Stream được nó!

  Stream<TestModel> get stream => _streamController.stream;

  void addProduct(TestModel testModel) {
    products.add(testModel);
    _streamController.add(testModel);
  }
}

final cart = CartBloc();

class TestModel{
  final String textString;
  final List<String> listString;
  final int count;

  TestModel(this.textString, this.listString, this.count);
}