// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tourism_trips/app_data.dart';

import '../models/trip.dart';
import '../widgets/category/trips_item_widget.dart';

class CategoryTripsScreen extends StatefulWidget {
  CategoryTripsScreen({Key? key}) : super(key: key);
  static const routeName = 'category-trips-screen';

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late List<Trip> displayTrip;
  late String categorytitle;
  @override
  void didChangeDependencies() {
    final nameArgiment =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final cateroryid = nameArgiment['id'];
    categorytitle = nameArgiment['title'].toString();

    displayTrip = Trips_data.where((trip) {
      return trip.categories.contains(cateroryid);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String tripid) {
    setState(() {
      displayTrip.removeWhere((trip) => trip.id == tripid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(categorytitle)),
      ),
      body: ListView.builder(
          itemCount: displayTrip.length,
          itemBuilder: (context, index) {
            return TripsItemWidget(
              removeItem: removeItem,
              id: displayTrip[index].id,
              duration: displayTrip[index].duration,
              imageUrl: displayTrip[index].imageUrl,
              season: displayTrip[index].season,
              title: displayTrip[index].title,
              tripType: displayTrip[index].tripType,
            );
          }),
    );
  }
}
