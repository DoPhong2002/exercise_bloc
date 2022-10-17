import 'dart:async';

class EXBloc {
  ///Them broadcast()  để có thể nhiều thằng có thể Stream được nó!
  final _EXStreamController = StreamController<String>.broadcast();

  Stream<String> get EXstream => _EXStreamController.stream;

  String url = '';

  void getUrl(String string) {
    url = string;
    print('EXbloc: $url');
    _EXStreamController.add(url);
  }
}
