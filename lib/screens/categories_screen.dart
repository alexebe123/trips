// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:tourism_trips/widgets/category/categories_item_widget.dart';
import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  static const nameRoute = 'Categories-Screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 7 / 8,
              mainAxisExtent: 200),
          children: Categories_data.map(
            (categoryData) => CategoryItem(
              category: categoryData,
            ),
          ).toList()),
    );
  }
}
