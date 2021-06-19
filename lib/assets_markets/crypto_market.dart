import 'package:finance_quote/finance_quote.dart';
import 'assets_market.dart';

class CryptoCurrency extends Asset {
  String _currencyCode = "";
  String _name = "";
  String _analystRating = "";
  String _symbol = "";
  double _price = 0.0;
  double _priceChange = 0.0;
  late AssetsMarket _market;

  static CryptoCurrency createCrypto(String symbol, String name, double price, String currencyCode, double priceChange, AssetsMarket market) {
    var s = new CryptoCurrency();
    s._currencyCode = currencyCode;
    s._name = name;
    s._price = price;
    s._priceChange = priceChange;
    s._symbol = symbol;
    s._market = market;
    return s;
  }

  @override
  String getCurrencyCode() => _currencyCode;

  @override
  String getName() => _name;

  @override
  double getPrice() => _price;

  @override
  double getPriceChange() => _priceChange;

  @override
  String getAnalystRating() => _analystRating;

  @override
  String getSymbol() => _symbol;

  @override
  AssetsMarket getAssetSource() => _market;
}

class CryptoMarket extends AssetsMarket {
  @override
  Future<List<Asset>> getListOfAssets() async {
    var toReturn = new List<Asset>.empty(growable: true);
    final symbolsToDownload = <String>['bitcoin', 'ethereum', 'dogecoin'];

    final Map<String, Map<String, dynamic>> quoteRaw =
    await FinanceQuote.getRawData(
        quoteProvider: QuoteProvider.coincap, symbols: symbolsToDownload);

    for (var symbol in quoteRaw.keys) {
      final parameters = quoteRaw[symbol];
      toReturn.add(CryptoCurrency.createCrypto(parameters!['symbol'],
          parameters['id'],
          parameters['priceUsd'] as double,
          "USD",
          parameters['changePercent24Hr'] as double,
          this));
    }

    return toReturn;
  }

  @override
  String getName() {
    return "Crypto Currencies";
  }

  @override
  Future<Asset> updatePriceOfAsset(Asset asset) async {
    final crypto = asset as CryptoCurrency;
    final sym = crypto.getSymbol();

    final Map<String, Map<String, dynamic>> quoteRaw =
        await FinanceQuote.getRawData(
        quoteProvider: QuoteProvider.coincap, symbols: <String>[sym]);

    final parameters = quoteRaw[sym];
    return CryptoCurrency.createCrypto(parameters!['symbol'],
        parameters['id'],
        parameters['priceUsd'] as double,
        "USD",
        parameters['changePercent24Hr'] as double,
        this);
  }
}