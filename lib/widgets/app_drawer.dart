// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

import '../screens/tabbar_screen.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text(
            'دليلك السياحي ',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
        ),
        buildListTile(
          'التصنيفات',
          Icons.calendar_view_day_outlined,
          TapBarScreen.nameRoute,
          context,
        ),
        buildListTile(
          'التصفيات',
          Icons.filter_list,
          FilterScreen.nameRoute,
          context,
        ),
      ]),
    );
  }

  ListTile buildListTile(
      String title, IconData icon, String onTapF, BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(onTapF);
      },
      leading: Icon(
        icon,
        size: 32,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
