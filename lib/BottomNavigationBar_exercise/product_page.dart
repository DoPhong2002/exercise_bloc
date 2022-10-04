import 'package:Flutter_father/BottomNavigationBar_exercise/bottom_model.dart';
import 'package:Flutter_father/learn_bloc/learn_bloc.dart';
import 'package:Flutter_father/learn_bloc/learn_bloc2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int a = 0;

  @override
  Widget build(BuildContext context) {
    final countCubit = BlocProvider.of<CountCubit>(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<CountCubit, CountState>(
          builder: (_, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    countCubit.increase();
                  },
                  icon: const Icon(
                    Icons.add_box_rounded,
                    size: 40,
                  ),
                ),
                Text(
                  '${countCubit.count}',
                  style: const TextStyle(fontSize: 40),
                ),
                IconButton(
                  onPressed: () {
                    countCubit.decrease();
                  },
                  icon: const Icon(
                    Icons.remove_circle,
                    size: 40,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
  Widget ccc(){
    final countCubit = BlocProvider.of<CountCubit>(context);
    return Container();
  }
}
