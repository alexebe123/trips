// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tourism_trips/screens/trips_detals_screen.dart';

import '../../models/trip.dart';

class TripsItemWidget extends StatelessWidget {
  const TripsItemWidget(
      {Key? key,
      required this.id,
      required this.removeItem,
      required this.duration,
      required this.imageUrl,
      required this.season,
      required this.title,
      required this.tripType})
      : super(key: key);
  final String id;
  final Function removeItem;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
      case Season.Autumn:
        return 'خريف';
      case Season.Summer:
        return 'صيف';
      case Season.Spring:
        return 'ربيع';
      default:
        return 'غير معروف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        return 'استكشاف';
      case TripType.Exploration:
        return 'نقاهة';
      case TripType.Recovery:
        return 'انشطة';
      case TripType.Therapy:
        return 'معالجة';
      default:
        return 'غير معروف';
    }
  }

  void selctItem(context) {
    Navigator.of(context)
        .pushNamed(TripsDetalsScreen.nameRoute, arguments: id)
        .then((trip) {
      removeItem(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selctItem(context),
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        elevation: 7,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 250,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.6,
                        1
                      ],
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8)
                      ]),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration الايام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),
                    ],
                  ),
                ]),
          )
        ]),
      ),
    );
  }
}
