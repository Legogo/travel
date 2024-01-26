import 'package:flutter/material.dart';
import 'package:travel/view_travel.dart';
import 'screen_loading.dart';

import 'screen_location.dart';
import 'screen_travels.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/travel",
      routes: {
        "/": (context) => const ScreenLoading(),
        "/home": (context) => const Univers(),
        "/location": (context) => const ScreenLocation(),
        "/travel": (context) => const ScreenTravels(),
        "/travel/instance": (context) => const ViewTravel()
      },
    ));

class Univers extends StatelessWidget {
  const Univers({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Center(
                    child:
                        Text("LANDING PAGE", style: TextStyle(fontSize: 30)))),
          ]),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/travel");
            },
            icon: const Icon(Icons.airplanemode_active)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/location");
            },
            icon: const Icon(Icons.location_city)),
      ]),
    );
  }
}
