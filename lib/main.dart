import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KANEKO',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle smallButtonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 15, color: Colors.white),
      padding: EdgeInsets.all(10.0),
      primary: Colors.teal[200],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: Colors.transparent)),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text('KANEKO'),
      ),
      body: Container(
        height: 50.0,
        margin: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 100,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: smallButtonStyle,
                onPressed: () {},
                child: Text("Option 1"),
              ),
            ),
            Container(
              width: 100,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: smallButtonStyle,
                onPressed: () {},
                child: Text("Option 1"),
              ),
            ),
            Container(
              width: 100,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: smallButtonStyle,
                onPressed: () {},
                child: Text("Option 2"),
              ),
            ),
            Container(
              width: 100,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: smallButtonStyle,
                onPressed: () {},
                child: Text("Option 3"),
              ),
            ),
            Container(
              width: 100,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: smallButtonStyle,
                onPressed: () {},
                child: Text("Option 4"),
              ),
            ),
            Container(
              width: 100,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: smallButtonStyle,
                onPressed: () {},
                child: Text("Option 5"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
