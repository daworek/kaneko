import 'package:finance_quote/finance_quote.dart';
import 'assets_market.dart';

class Stock extends Asset {
  String _currencyCode = "";
  String _name = "";
  String _analystRating = "";
  String _symbol = "";
  double _price = 0.0;
  double _priceChange = 0.0;
  late AssetsMarket _market;

  static Stock createStock(String symbol, String name, double price, String currencyCode, double priceChange, String analystRating, AssetsMarket market) {
    var s = new Stock();
    s._currencyCode = currencyCode;
    s._name = name;
    s._price = price;
    s._priceChange = priceChange;
    s._symbol = symbol;
    s._analystRating = analystRating;
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

class StockMarket extends AssetsMarket {
  @override
  Future<List<Asset>> getListOfAssets() async {
    var toReturn = new List<Asset>.empty(growable: true);
    final symbolsToDownload = <String>['MSFT', 'KO', 'BBC', 'TSLA', 'MU', 'AZN', 'PFE', 'ADBE', 'NOK', 'GOOG'];

    final Map<String, Map<String, dynamic>> quoteRaw =
        await FinanceQuote.getRawData(
        quoteProvider: QuoteProvider.yahoo, symbols: symbolsToDownload);

    for (var symbol in quoteRaw.keys) {
      final parameters = quoteRaw[symbol];
      toReturn.add(Stock.createStock(symbol,
          parameters!['longName'],
          parameters['regularMarketPrice'],
          parameters['currency'],
          parameters['regularMarketChangePercent'],
          parameters['averageAnalystRating'],
          this));
    }

    return toReturn;
  }

  @override
  String getName() {
    return "Stock market";
  }

  @override
  Future<Asset> updatePriceOfAsset(Asset asset) async {
    final stock = asset as Stock;
    final sym = stock.getSymbol();
    final Map<String, Map<String, dynamic>> quoteRaw =
        await FinanceQuote.getRawData(
        quoteProvider: QuoteProvider.yahoo, symbols: <String>[sym]);

      final parameters = quoteRaw[sym];
      return Stock.createStock(sym,
          parameters!['longName'],
          parameters['regularMarketPrice'],
          parameters['currency'],
          parameters['regularMarketChangePercent'],
          parameters['averageAnalystRating'],
          this);
  }
}