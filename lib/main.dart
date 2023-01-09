// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tourism_trips/screens/trips_detals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_trips_screen.dart';
import 'screens/filter_screen.dart';
import 'screens/tabbar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism Trips',

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // Arab, no country emarat
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Tajawal',
      ),
      //  home: CategoriesScreen(),
      initialRoute: TapBarScreen.nameRoute,
      routes: {
        TapBarScreen.nameRoute: (context) => TapBarScreen(),
        CategoryTripsScreen.routeName: (context) => CategoryTripsScreen(),
        TripsDetalsScreen.nameRoute: (context) => TripsDetalsScreen(),
        FilterScreen.nameRoute: (context) => FilterScreen(),
        CategoriesScreen.nameRoute: (context) => CategoriesScreen(),
      },
    );
  }
}
