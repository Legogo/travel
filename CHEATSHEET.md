
      //Icon(Icons.airplane_ticket, color: Colors.lightBlue, size: 50)),
      //Image.asset("medias/airplane.png")),
      //Center(Text("hello")),

https://api.flutter.dev/flutter/painting/TextStyle-class.html
      
      body: Center(
          child: TextButton.icon(
        icon: Icon(Icons.mail),
        label: Text("mail"),
        onPressed: () {
          print("BUTTON");
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
      )),

      
      body: Center(
          child: IconButton(
        onPressed: () => {},
        icon: Icon(Icons.alternate_email),
        color: Colors.amber,
      )),


Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          margin: EdgeInsets.all(20),
          color: Colors.grey[700],
          child: Text("hello")),

      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),



      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              child: Text("lol"),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50)),
          Text("lol"),
          Text("lol")
        ],
      ),


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 2, child: Image.asset("medias/airplane.png")),
          Expanded(flex: 1, child: Text("lol")),
          Expanded(flex: 1, child: Text("lol")),
          Expanded(flex: 1, child: Text("lol")),
        ],


// some layout tricks
https://www.youtube.com/watch?v=c063ddhWafo

// state object
https://www.youtube.com/watch?v=p5dkB3Mrxdo

# map

class MyApp extends StatelessWidget {
  List<Card> cards = [Card(), Card(), Card()];

...

      body: Column(
        children: cards.map((c) {
          return c;
        }).toList(),

// DATETIME

https://dartandflutter.com/datetimes-in-dart-flutter/

// SAVE PDF

https://stackoverflow.com/questions/75531021/how-to-save-pdf-in-the-local-storage-in-flutter

// VIEW PDF

https://www.kindacode.com/article/viewing-pdf-files-in-flutter/