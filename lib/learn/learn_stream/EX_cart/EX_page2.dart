import 'package:Flutter_father/learn/learn_stream/EX_cart/EX_bloc.dart';
import 'package:Flutter_father/learn/learn_stream/bloc/issue_bloc.dart';
import 'package:flutter/material.dart';

class EXPage2 extends StatefulWidget {
  const EXPage2({Key? key}) : super(key: key);

  @override
  State<EXPage2> createState() => _EXPage2State();
}

class _EXPage2State extends State<EXPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EX2'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: count.streamCount,
          builder: (context, snapshot) {
            return Text('${count.count ?? 0}');
          },
        ),
      ),
    );
  }
}
