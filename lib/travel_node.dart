import 'package:flutter/material.dart';

import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

class TravelNode extends StatelessWidget {
  const TravelNode(this.data, {super.key});
  final TravelNodeData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/");
      },
      child: Row(children: [
        Expanded(
            flex: 1,
            child: Column(
              children: [Text(data.dateLabel()), Icon(data.cardIcon())],
            )),
        Expanded(
          flex: 3,
          child: Column(
            children: [Text(data.inLabel()), Text(data.outLabel())],
          ),
        ),
        IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          icon: const Icon(Icons.arrow_right),
          //label: Text("lol"),
          onPressed: () => {
            Navigator.pushNamed(context, "/travel/instance", arguments: data)
          },
        )
      ]),
    );
  }
}

// https://api.flutter.dev/flutter/dart-core/DateTime-class.html

enum TravelType {
  none,
  plane,
  train,
}

class TravelNodeData {
  TravelType type;

  DateTime outbound = DateTime.now(); // when travel starts
  DateTime inbound = DateTime.now(); // when travel ends

  String attached;

  TravelNodeData(this.type, this.outbound, this.inbound, this.attached);

  static Future<List<TravelNodeData>> fetch() async {
    String response;
    response = await rootBundle.loadString("database/travels.json");
    // https://api.flutter.dev/flutter/dart-convert/jsonDecode.html
    dynamic json = jsonDecode(response);
    List<TravelNodeData> list = [];

    //print(json);

    for (int i = 0; i < json.length; i++) {
      var js = json[i];
      var start = DateTime.parse(js["outbound"]);
      var end = DateTime.parse(js["inbound"]);

      // https://stackoverflow.com/questions/27673781/enum-from-string
      var t = TravelType.values
          .firstWhere((e) => e.toString() == "TravelType." + js["type"]);

      var dat = TravelNodeData(t, start, end, js["attached"]);

      list.add(dat);
    }

    print("found x${list.length} travel node data(s)");

    return list;
  }

  IconData cardIcon() {
    switch (type) {
      case TravelType.train:
        return Icons.train;
      case TravelType.plane:
        return Icons.airplane_ticket;
      default:
        return Icons.delete;
    }
  }

  //https://stackoverflow.com/questions/57106087/how-to-convert-datetime-to-a-string
  String dateLabel() => DateFormat("yyyy-MM-dd").format(outbound);
  String outLabel() => outbound.toString();
  String inLabel() => inbound.toString();
  String getAttached() => attached;
}
