import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnew/learn_bloc/learn_bloc.dart';
import 'package:newnew/mini_project_bloc/mini_shopping_page_1.dart';
import 'package:newnew/mini_project_bloc/mini_shopping_page_2.dart';
import 'package:newnew/todo_bloc/todo_page.dart';
import 'category_demo/category_screen.dart';
import 'learn_bloc/demo_counter_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: CounterPage(),
      home: MiniShoppingPage1(),
      // home: TodoBloc(),
      // home: MyHomePage(title: 'CouterCubit',),
      // home: CategoryScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //CouterCubit khởi tạo
   CounterCubit _couterCubit = CounterCubit();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            BlocBuilder<CounterCubit, int>(
              bloc: _couterCubit,
              builder: (context, state){
                return Text('${_couterCubit.couter}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Text('Cong'),
                  onTap: (){
                    _couterCubit.increment();
                  },
                ),
                GestureDetector(
                  child: Text('Tru'),
                  onTap: (){
                    _couterCubit.decrement();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
