import 'dart:async';

import 'package:Flutter_father/learn/learn_stream/exr1/api/issue_service.dart';
import 'package:Flutter_father/learn/learn_stream/exr1/model_json/issue.dart';
import 'package:Flutter_father/modun/service/api_service.dart';

///singleton
class IssueBloc {
  static final _count = IssueBloc._internal();

  factory IssueBloc() => _count;

  IssueBloc._internal();

  ///Them broadcast()  để có thể nhiều thằng có thể Stream được nó!
  final _countStreamController = StreamController<int>.broadcast();

  Stream<int> get streamCount => _countStreamController.stream;

  // StreamSink<int> get sink => _countStreamController.sink;

  final _issueStreamController = StreamController<List<Issue>>.broadcast();

  Stream<List<Issue>> get streamIssue => _issueStreamController.stream;

  final issues = <Issue>[];

  int count = 0;

  //
  // IssueBloc() {
  //   getIssues();
  // }

  void increment() {
    count += 1;
    _countStreamController.add(count);
  }

  void decrement() {
    count -= 1;
    // sink.add(count);
    // _countStreamController.sink.add(count);
    _countStreamController.add(count);
  }
///API
  void getIssues() {
    apiService.getIssue(offset: issues.length).then((value) {
      if (value.isNotEmpty) {
        issues.addAll(value);
        _issueStreamController.add(issues);
      }
    }).catchError((e) {
      _issueStreamController.addError(e.toString());
    });
  }
}

final count = IssueBloc();
