import 'package:Flutter_father/todo_bloc/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TodoModel? _todoModelSelected;
  TextEditingController _controller = TextEditingController();
  bool _firstRuntime = true;

  @override
  void initState() {
    // TODO: implement initState
    // _todoCubit.createListTodo();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void myInitState() async {
    // print('luu du lieu');
    context.read<TodoProvider>().getListTodoLocal();
    print('xuat du lieu');
  }

  @override
  Widget build(BuildContext context) {
    if (_firstRuntime) {
      _firstRuntime = false;
      myInitState();
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('TodoList'),
            IconButton(
                onPressed: () {
                  context.read<TodoProvider>().addTodo(_controller.text);
                  _controller.text = '';
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (_todoModelSelected != null) {
                context.read<TodoProvider>().removeTodo(_todoModelSelected!);
              }
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Nhap todo zo day ....'),
          ),
          Expanded(
            child: Consumer(
              builder: (_, TodoProvider todoProvider, __) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  itemCount: todoProvider.listTodoModels.length,
                  separatorBuilder: (BuildContext, index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemBuilder: (_, index) {
                    return buildItem(
                        todoProvider.listTodoModels[index], todoProvider);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(TodoModel todoModel, TodoProvider todoProvider) {
    return InkWell(
      onTap: () {
        print('1: $_todoModelSelected');
        if (_todoModelSelected?.timeNow == todoModel.timeNow) {
          _todoModelSelected = null;
          print('2: $_todoModelSelected');
        } else {
          _todoModelSelected = todoModel;
          print('3: $_todoModelSelected');
        }
        todoProvider.setUp();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: todoModel.timeNow == _todoModelSelected?.timeNow
              ? Colors.green
              : Colors.blue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${todoModel.name}'),
            Text('${todoModel.timeNow}'),
          ],
        ),
      ),
    );
  }
}
