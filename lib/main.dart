import 'package:flutter/material.dart';
import 'package:place_locator/providers/place_provider.dart';
import 'package:place_locator/screens/add_place_screen.dart';
import 'package:place_locator/screens/place_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlaceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Place Locator',
        theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.tealAccent,
        ),
        home: PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName: (context) => AddPlaceScreen(),
        },
      ),
    );
  }
}
