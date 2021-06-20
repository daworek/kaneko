import 'package:kaneko/assets_markets/crypto_market.dart';
import 'package:kaneko/assets_markets/stock_market.dart';

abstract class Asset {

  String getName();
  String getSymbol();
  String getAnalystRating();
  double getPrice();
  String getCurrencyCode();
  double getPriceChange();
  AssetsMarket getAssetSource();
}

abstract class AssetsMarket {

  String getName();
  Future<List<Asset>> getListOfAssets();
  Future<Asset> updatePriceOfAsset(Asset asset);
}

class AssetsMarkets {
  static final AssetsMarkets _assetsMarkets = new AssetsMarkets._init();
  final Map<String, AssetsMarket> _availableAssetsMarkets = new Map();

  factory AssetsMarkets() {
    return _assetsMarkets;
  }

  AssetsMarkets._init() {
    var stockMarket = new StockMarket();
    _availableAssetsMarkets[stockMarket.getName()] = stockMarket;
    var cryptoMarket = new CryptoMarket();
    _availableAssetsMarkets[cryptoMarket.getName()] = cryptoMarket;
  }

  Iterable<AssetsMarket> getAvailableAssetsMarkets() {
    return _availableAssetsMarkets.values;
  }

  AssetsMarket getAssetsMarketByName(String name) {
    var toReturn = _availableAssetsMarkets[name];
    if (toReturn == null) {
      throw Exception("No assets market with the given name");
    } else return toReturn;
  }
}