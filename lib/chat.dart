import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  Bubble({required this.message, required this.time, this.isMe});

  final String message, time;
  final isMe;
  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.yellow[700] : Color(0xff03dac6);
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final radius = isMe
        ? BorderRadius.only(
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0, left: 10.0),
                child: Text(message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        )),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class BubbleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff03dac6),
        title: Text('KANEKO'),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Bubble(
              message:
                  'Cze????! Jestem NEKO, Tw??j osobisty asystent. W czym mog?? pom??c?',
              time: '12:00',
              isMe: false,
            ),
            Bubble(
              message: 'Ile mam na koncie 1?',
              time: '12:00',
              isMe: true,
            ),
            Bubble(
              message: 'Na koncie 1 pozosta??o: 200 z??',
              time: '12:01',
              isMe: false,
            ),
            Bubble(
              message: 'ok',
              time: '12:01',
              isMe: true,
            ),
            Bubble(
              message: 'Niespodzianka! Dosta??e?? prezent od Karoliny:',
              time: '13:21',
              isMe: false,
            ),
            Bubble(
              message: 'TORT URODZINOWY!',
              time: '13:21',
              isMe: false,
            ),
            Container(
              height: 200.0,
              width: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage('/images/tort.png'),
                ),
              ),
            ),
            Bubble(
              message: 'Mo??esz odebra?? go w najbli??szej cukierni. Smacznego!',
              time: '13:21',
              isMe: false,
            ),
            Bubble(
              message: 'super :D',
              time: '13:25',
              isMe: true,
            ),
          ],
        ),
      ),
    );
  }
}
