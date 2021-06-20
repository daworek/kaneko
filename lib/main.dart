import 'package:flutter/material.dart';
import 'package:kaneko/security_quiz.dart';

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
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      padding: EdgeInsets.all(10.0),
      primary: Colors.teal[400],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: Colors.transparent)),
    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        backgroundColor: Color(0xff03dac6),
        title: Text('KANEKO'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            color: Color.fromRGBO(249, 249, 249, 100),
            child: Column(
              children: <Widget>[
                Container(
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
                          child: Text("Blik"),
                        ),
                      ),
                      Container(
                        width: 100,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: smallButtonStyle,
                          onPressed: () {},
                          child: Text("Przelew"),
                        ),
                      ),
                      Container(
                        width: 100,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: smallButtonStyle,
                          onPressed: () {},
                          child: Text("Statystyki"),
                        ),
                      ),
                      Container(
                        width: 100,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: smallButtonStyle,
                          onPressed: () {},
                          child: Text("Inwestycje"),
                        ),
                      ),
                      Container(
                        width: 100,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: smallButtonStyle,
                          onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (builder) => SecurityQuiz())); },
                          child: Text("Moje quizy"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              height: 250.0,
                              width: 250.0,
                              child: IconButton(
                                padding: EdgeInsets.all(5.0),
                                icon: Image.asset('/images/domek1.png'),
                                iconSize: 350,
                                alignment: Alignment.topCenter,
                                onPressed: () {},
                              )),
                          Text(
                            'KONTO 1\nHistoria transakcji',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 2),
                          ),
                          Text(
                            'transakacja 1\ntransakacja 2\ntransakacja 3\ntransakacja 4',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                height: 2),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              height: 250.0,
                              width: 250.0,
                              child: IconButton(
                                padding: EdgeInsets.all(5.0),
                                icon: Image.asset('/images/domek2.png'),
                                iconSize: 350,
                                alignment: Alignment.topCenter,
                                onPressed: () {},
                              )),
                          Text(
                            'KONTO 2\nHistoria transakcji',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 2),
                          ),
                          Text(
                            'transakacja 1\ntransakacja 2\ntransakacja 3\ntransakacja 4',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                height: 2),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                              height: 250.0,
                              width: 250.0,
                              child: IconButton(
                                padding: EdgeInsets.all(5.0),
                                icon: Image.asset('/images/domek1.png'),
                                iconSize: 350,
                                alignment: Alignment.topCenter,
                                onPressed: () {},
                              )),
                          Text(
                            'KONTO 3\nHistoria transakcji',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 2),
                          ),
                          Text(
                            'transakacja 1\ntransakacja 2\ntransakacja 3\ntransakacja 4',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                height: 2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            right: 25,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton.extended(
                    backgroundColor: const Color(0xff03dac6),
                    foregroundColor: Colors.white,
                    onPressed:  () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => BubbleScreen()));
                },
                    icon: Icon(Icons.more_horiz),
                    label: Text('NEKO'),
                  ),
                  IconButton(
                    onPressed:  () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => BubbleScreen()));
                },
                    icon: Image.asset('/images/kotek_glowa.png'),
                    iconSize: 100.0,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
