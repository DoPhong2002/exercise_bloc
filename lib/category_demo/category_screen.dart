import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newnew/category_demo/category_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryCubit _categoryCubit = CategoryCubit();

  @override
  void initState() {
    _categoryCubit.createListCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh muc san pham'),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        bloc: _categoryCubit,
        builder: (_, state) {
          if (_categoryCubit.listCategory.isEmpty) {
            return const Center(child: Text('Dang lay du lieu'));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 160,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return CategoryItem(
                  categoryModel: _categoryCubit.listCategory[index]);
            },
            itemCount: _categoryCubit.listCategory.length,
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          categoryModel.urlPicture ?? '',
          width: 80,
          height: 80,
        ),
        Text(categoryModel.name ?? ''),
      ],
    );
  }
}
