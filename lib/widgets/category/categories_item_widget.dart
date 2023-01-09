// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tourism_trips/models/category.dart';
import 'package:tourism_trips/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category
      //  required this.imageUrl,
      //  required this.categoryId,
      // required this.title
      //
      })
      : super(key: key);
  final Category category;
  //final String categoryId;
  //final String title;
  //final String imageUrl;
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.routeName, arguments: {
      'id': category.id,
      'title': category.title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                category.imageUrl,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                category.title,
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
