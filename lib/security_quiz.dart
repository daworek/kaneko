import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:kaneko/main.dart';

class SecurityQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KANEKO',
      home: SecurityQuizPage(
        title: "KANEKO Quiz o bezpieczeństwie",
      ),
    );
  }
}

class SecurityQuizPage extends StatefulWidget {
  SecurityQuizPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SecurityQuizPageState createState() => _SecurityQuizPageState();
}

class _SecurityQuizPageState extends State<SecurityQuizPage> {
  int question = 1;
  int goldfish_count = 0;

  Future<void> _showDialog(Text title, Text subtitle, Text content,
      void Function() dismissed) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                subtitle,
                content,
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Rozumiem'),
              onPressed: () {
                Navigator.pop(context);
                dismissed();
              },
            ),
            TextButton(
              child: const Text('Chcę wiedzieć więcej'),
              onPressed: () {
                Navigator.pop(context);
                // TODO
              },
            ),
          ],
        );
      },
    );
  }

  void _onGivenPassword() {
    _showDialog(
        Text("Wprowadziłeś swoje hasło! Pomyłka!",
            style: TextStyle(color: Colors.red)),
        Text("Nigdy nie podawaj swojego hasła!",
            style: TextStyle(color: Colors.red)),
        Text(
            "Twoje hasło jest bezpieczne, ale pamiętaj żeby nikomu go nie podawać. PKO BP nigdy Cię o nie nie poprosi."),
        _showQuestion2);
  }

  void _onNotGivenPassword() {
    goldfish_count++;
    _showDialog(
        Text("Nie podałeś swojego hasła! Dobrze!",
            style: TextStyle(color: Colors.green)),
        Text("Nigdy nie podawaj swojego hasła!",
            style: TextStyle(color: Colors.red)),
        Text(
            "Gratulajce! Dobra odpowiedź. Pamiętaj, że PKO BP nigdy Cię o nie nie poprosi.."),
        _showQuestion2);
  }

  void _showQuestion2() {
    setState(() {
      question = 2;
    });
  }

  void _onLinkTap() {
    _showDialog(
        Text("Kliknąłeś w link! Pomyłka!", style: TextStyle(color: Colors.red)),
        Text("Nie klikaj w podejrzane linki udające prawdziewe!",
            style: TextStyle(color: Colors.red)),
        Text("Adres strony PKO BP to www.pkobp.pl"),
        _showQuestion3);
  }

  void _onNotLinkTap() {
    goldfish_count++;
    _showDialog(
        Text("Nie kilknąłeś w link! Dobra robota!",
            style: TextStyle(color: Colors.green)),
        Text("Nie klikaj w podejrzane linki udające prawdziewe!",
            style: TextStyle(color: Colors.red)),
        Text("Adres strony PKO BP to www.pkobp.pl"),
        _showQuestion3);
  }

  void _showQuestion3() {
    setState(() {
      question = 3;
    });
  }

  void _closeQuiz() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Center();

    if (question == 1) {
      body = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Quiz o bezpieczeństwie',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Pytanie 1',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Aby rozpocząć, podaj swoje hasło:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                margin: const EdgeInsets.all(30.0),
                child: TextField(
                  obscureText: true,
                )),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: _onGivenPassword,
                child: Text("Ok, następne pytanie")),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: _onNotGivenPassword,
                child: Text("Nie, nie podam swojego hasła"))
          ],
        ),
      );
    } else if (question == 2) {
      body = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Quiz o bezpieczeństwie',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Pytanie 2',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Czy chcesz otworzyć ten link?',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Linkify(
                text: "www.bank-pkobp.pl",
                style: TextStyle(
                  fontSize: 18,
                ),
                onOpen: (link) => {_onLinkTap()}),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: _onLinkTap,
                child: Text("Ok, przejdź do tej strony")),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: _onNotLinkTap,
                child: Text("Nie, nie otworzę tego linku"))
          ],
        ),
      );
    } else if (question == 3) {
      body = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Quiz o bezpieczeństwie',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Gratulacje za ukończenie quizu!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Twoja liczba rybek za ten quiz: $goldfish_count',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('/images/rybka.png'),
                ),
              ),
            ),
            Text(
              'Regularnie będziemy proponować Ci przystąpienie do takiego quizu.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Linkify(
                text:
                    "A w międzyczasie możesz poczytać o bezpieczństwie w sieci tutaj: www.pkobp.pl",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: _closeQuiz, child: Text("Zamknij quiz"))
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body,
    );
  }
}
