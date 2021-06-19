import 'assets_market.dart';

class NotEnoughResources implements Exception { }
class NoSuchAsset implements Exception { }

abstract class TradingPolicy {
  double _resources = 0.0;
  Map<Asset, double> _assertsAndQuantities = new Map();

  TradingPolicy(double initResources) {
    _resources = initResources;
  }

  Future<bool> _canBuy(Asset asset, double quantity) async {
    asset = await asset.getAssetSource().updatePriceOfAsset(asset);
    return _resources >= (asset.getPrice() * quantity);
  }

  void sell(Asset asset, double quantity) {
    if (!_assertsAndQuantities.keys.contains(asset)) {
      throw NoSuchAsset();
    }
    _performSellingOperation(asset, quantity);
  }

  Future<void> buy(Asset asset, double quantity) async {
    final canBeBought = await _canBuy(asset, quantity);
    if (!canBeBought) throw NotEnoughResources();
    _performBuyingOperation(asset, quantity);
  }

  void _performSellingOperation(Asset asset, double quantity);
  void _performBuyingOperation(Asset asset, double quantity);
}

class PlaygroundTradingPolicy extends TradingPolicy {
  PlaygroundTradingPolicy(double initResources) : super(initResources);

  @override
  void _performBuyingOperation(Asset asset, double quantity) {
    // Nothing here on purpose
  }

  @override
  void _performSellingOperation(Asset asset, double quantity) {
    // Nothing here on purpose
  }

}