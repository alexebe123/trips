// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:tourism_trips/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const nameRoute = 'Filter-Screen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isInSamer = false;
  var _isInWenter = false;
  var _isForFamly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawerWidget(),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Column(
            children: [
              newSwitshTileList('الرحلات الصيفية', 'الرحلات في فترة الصيف فقط',
                  (curentValue) {
                setState(() {
                  _isInSamer = curentValue;
                });
              }, _isInSamer),
              newSwitshTileList('الرحلات الشتوية', 'الرحلات في فترة الشتاء فقط',
                  (curentValue) {
                setState(() {
                  _isInWenter = curentValue;
                });
              }, _isInWenter),
              newSwitshTileList(
                  'الرحلات العائلية', 'اظهار الرحلات العائلية فقط',
                  (curentValue) {
                setState(() {
                  _isForFamly = curentValue;
                });
              }, _isForFamly),
            ],
          ),
        ),
      ]),
    );
  }

  Widget newSwitshTileList(
      String title, String subTitle, onUpdate, var curentValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: curentValue,
      onChanged: onUpdate,
    );
  }
}
