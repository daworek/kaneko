import 'package:flutter/material.dart';
import 'package:kaneko/assets_markets/assets_market.dart';
import 'package:kaneko/assets_markets/trading_policy.dart';
import 'package:kaneko/main.dart';

class InvestingPlayground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KANEKO',
      home: InvestingPlaygroundPage(title: "Inwestycje",),
    );
  }
}

class InvestingPlaygroundPage extends StatefulWidget {
  InvestingPlaygroundPage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  _InvestingPlaygroundPageState createState() => _InvestingPlaygroundPageState();
}

enum _InvestingPlaygroundPhase {
  AMOUNT_TO_INVEST,
  MARKETS,
  STOCK_MARKET,
  CRYPTO_MARKET,
}

class _InvestingPlaygroundPageState extends State<InvestingPlaygroundPage> {
  _InvestingPlaygroundPhase _state = _InvestingPlaygroundPhase.AMOUNT_TO_INVEST;
  late TradingPolicy _tradingPolicy;
  late AssetsMarkets _markets;
  TextEditingController _textFieldController = new TextEditingController(text: "100");

  @override
  Widget build(BuildContext context) {
    Widget body = Center();

    if (_state == _InvestingPlaygroundPhase.AMOUNT_TO_INVEST) {
      body = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Kwota początkowa'),
              TextField(
                  controller: _textFieldController,
                  keyboardType: TextInputType.number
              ),
              TextButton(
                child: Text('Anuluj'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) { return MyApp(); }));
                },
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  final amount = int.parse(_textFieldController.text).toDouble();
                  setState(() {
                    _tradingPolicy = new PlaygroundTradingPolicy(amount);
                    _state = _InvestingPlaygroundPhase.MARKETS;
                  });
                },
              ),
            ]
        ),
      );
    } else if (_state == _InvestingPlaygroundPhase.MARKETS) {
      _markets = new AssetsMarkets();
      final markets = _markets.getAvailableAssetsMarkets().toList();
      body = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: markets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(markets[index].getName()),
                );
              }),
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