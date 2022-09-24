import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnew/todo_bloc/todo_model.dart';

class TodoBloc extends StatefulWidget {
  const TodoBloc({Key? key}) : super(key: key);

  @override
  State<TodoBloc> createState() => _TodoBlocState();
}

class _TodoBlocState extends State<TodoBloc> {
  final TextEditingController controller = TextEditingController();
  late TodoModel itemSelectNow;
  late String todoInto = controller.text;
  final TodoCubit _todoCubit = TodoCubit();
  bool _firstRuntime = true;

  @override
  void initState() {
    // TODO: implement initState
    // _todoCubit.createListTodo();
    super.initState();
  }

  void myInitState(TodoCubit todoCubit) async {
    // print('luu du lieu');
    await todoCubit.getListTodoLocal();
    print('xuat du lieu');
  }

  @override
  Widget build(BuildContext context) {
    final listTodoCubit = BlocProvider.of<TodoCubit>(context);
    if (_firstRuntime) {
      _firstRuntime = false;
      myInitState(listTodoCubit);
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('TodoList'),
            IconButton(
                onPressed: () {
                  listTodoCubit.addTodo(todoInto.toString());
                  print(todoInto);
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              listTodoCubit.removeTodo(itemSelectNow);
              print('con chim');
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        // bloc: _todoCubit,
        builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listTodoCubit.listTodoModel.length,
                  itemBuilder: (_, index) {
                    final todo = listTodoCubit.listTodoModel[index];
                    return GestureDetector(
                      onTap: () {
                        itemSelectNow = todo;
                        listTodoCubit.setColor(itemSelectNow);
                        print(itemSelectNow.name);
                      },
                      child: Column(
                        children: [
                          itemTodo(todo),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget itemTodo(TodoModel todoModel) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: todoModel.colors! ? Colors.green : Colors.yellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todoModel.name!),
          Text(todoModel.timeNow!),
        ],
      ),
    );
  }
}
