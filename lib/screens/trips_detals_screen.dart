// ignore_for_file: avoid_unnecessary_containers,prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tourism_trips/app_data.dart';

class TripsDetalsScreen extends StatelessWidget {
  TripsDetalsScreen({Key? key}) : super(key: key);
  static const nameRoute = 'Trips-detals-screen';

  Widget buildContainer(String text) {
    return Container(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w300,
              color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget buildContainerForListViwe(Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 200,
          child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    String nameArgiment = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip =
        Trips_data.firstWhere((trip) => trip.id == nameArgiment);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
      ),
      body: ListView(
        children: [
          Column(children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildContainer('الأنشطة'),
            buildContainerForListViwe(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(selectedTrip.activities[index]),
                    ),
                  ),
                ),
              ),
            ),
            buildContainer('البرنامج اليومي'),
            SizedBox(
              height: 10,
            ),
            buildContainerForListViwe(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            child: Text(
                              'يوم ${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.amber),
                        title: Text(selectedTrip.program[index]),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(selectedTrip.id);
        },
      ),
    );
  }
}
