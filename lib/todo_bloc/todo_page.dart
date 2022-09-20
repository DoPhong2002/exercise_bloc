import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnew/mini_project_bloc/shopping.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    _todoCubit.createListTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('TodoList'),
            IconButton(
                onPressed: () {
                  _todoCubit.addTodo(todoInto.toString());
                  print('$todoInto');
                },
                icon: const Icon(Icons.add)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _todoCubit.removeTodo(itemSelectNow);
              print('con chim');
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        bloc: _todoCubit,
        builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(),
              ),
              Expanded(child: buildListView()),
            ],
          );
        },
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: _todoCubit.listTodoModel.length,
      itemBuilder: (_, index) {
        final todo = _todoCubit.listTodoModel[index];
        return GestureDetector(
          onTap: () {
            itemSelectNow = todo;
            _todoCubit.setColor(itemSelectNow);
            print('${itemSelectNow.name}');
          },
          child: Column(
            children: [
              itemTodo(todo),
            ],
          ),
        );
      },
    );
  }

  Widget itemTodo(TodoModel todoModel) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: todoModel.colors ? Colors.green : Colors.yellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todoModel.name),
          Text(todoModel.timeNow),
        ],
      ),
    );
  }



}
