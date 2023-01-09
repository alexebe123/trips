// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tourism_trips/screens/categories_screen.dart';

import '../widgets/app_drawer.dart';
import 'favorite_screen.dart';

class TapBarScreen extends StatefulWidget {
  const TapBarScreen({Key? key}) : super(key: key);
  static const nameRoute = '/';
  @override
  State<TapBarScreen> createState() => _TapBarScreenState();
}

class _TapBarScreenState extends State<TapBarScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Map<String, Object>> _scrennSelecter = [
    {'Screen': CategoriesScreen(), 'Title': 'تصنيفات الرحلة'},
    {'Screen': FavoriteScreen(), 'Title': 'الرحلات المفضلات '}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_scrennSelecter[_selectedScreenIndex]['Title'] as String),
        ),
      ),
      drawer: AppDrawerWidget(),
      body: _scrennSelecter[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex,
          onTap: _selectScreen,
          backgroundColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'صفحة التصنيفات'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلات'),
          ]),
    );
  }
}
