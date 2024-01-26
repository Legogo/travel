import 'package:flutter/material.dart';
import 'travel_node.dart';

class ScreenTravels extends StatelessWidget {
  const ScreenTravels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My activities",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: "OpenSans",
                color: Colors.grey[600])),
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      body: FutureBuilder<List<TravelNodeData>>(
          future: TravelNodeData.fetch(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<TravelNodeData> travels = snapshot.data!;
            return ListView.builder(
                itemCount: travels.length,
                itemBuilder: (content, index) {
                  return TravelNode(travels[index]);
                });
          }),
      floatingActionButton:
          FloatingActionButton(onPressed: () => {}, child: const Text("click")),
      backgroundColor: Colors.blue[300],
    );
  }
}
