import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnew/learn_bloc/learn_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _counterCubit = CounterCubit();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late SharedPreferences prefs;

  @override
  void initState() {
    _initSharePreference();
    // TODO: implement initState
    super.initState();
  }

  void _initSharePreference() async {
    prefs = await SharedPreferences.getInstance();
    testSaveDataLocal();
  }

  void testSaveDataLocal() async {
    await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
    await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
    await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
    await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
    await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);

    print('DataInt: ${prefs.getInt('counter')} \n'
        'DataBool: ${prefs.getBool('repeat')} \n'
        'DataDouble: ${prefs.getDouble('decimal')} \n'
        'DataString: ${prefs.getString('action')} \n'
        'DataStringList: ${prefs.getStringList('items')} \n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        children: [
          BlocListener<CounterCubit, int>(
            bloc: _counterCubit,
            listener: (context, count) {
              if (count.runtimeType == int && count % 5 == 0) {
                print('lucky number');
              }
            },
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, count) => Center(child: Text('$count')),
              bloc: _counterCubit,
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _counterCubit.increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => _counterCubit.decrement(),
          ),
        ],
      ),
    );
  }
}
