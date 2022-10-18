import 'dart:async';

class EXBloc {

  static final _exBloc = EXBloc._internal();
  factory EXBloc()=> _exBloc;
  EXBloc._internal();

  ///Them broadcast()  để có thể nhiều thằng có thể Stream được nó!
  final _EXStreamController = StreamController<String>.broadcast();

  Stream<String> get exStream => _EXStreamController.stream;

  String url = '';

  void getUrl(String string) {
    url = string;
    print('EXbloc: $url');
    _EXStreamController.add(url);
  }
}
final exBloc = EXBloc();
