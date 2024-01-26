import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

import 'travel_node.dart';

class ViewTravel extends StatefulWidget {
  const ViewTravel({Key? key}) : super(key: key);

  @override
  State<ViewTravel> createState() => _ViewTravelState();
}

class _ViewTravelState extends State<ViewTravel> {
  bool _isLoading = true;
  String _pdfPath = "";
  late PDFDocument _pdf;

  void _loadFile() async {
    String path = "database/attached/" + _pdfPath;
    print(path);

    setState(() {
      _isLoading = true;
    });
    _pdf = await PDFDocument.fromAsset(path);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    TravelNodeData? data =
        ModalRoute.of(context)!.settings.arguments as TravelNodeData;

    return Scaffold(
        appBar: AppBar(
          title: Text(data.dateLabel(),
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "OpenSans",
                  color: Colors.grey[600])),
          centerTitle: true,
          backgroundColor: Colors.red[400],
        ),
        body: Column(children: [
          Icon(data.cardIcon()),
          Text(data.outLabel()),
          Text(data.inLabel()),
          _pdfPath.length <= 0
              ? IconButton(
                  icon: Icon(Icons.picture_as_pdf),
                  //label: Text("open"),
                  onPressed: () {
                    _pdfPath = data.getAttached();
                    _loadFile();
                  },
                )
              : _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : PDFViewer(document: _pdf)
        ]));
  }
}
