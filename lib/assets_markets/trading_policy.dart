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

  Future<void> sell(Asset asset, double quantity) async {
    if (!_assertsAndQuantities.keys.contains(asset)) {
      throw NoSuchAsset();
    }
    if (_assertsAndQuantities[asset]! < quantity) {
      throw NotEnoughResources();
    }
    asset = await asset.getAssetSource().updatePriceOfAsset(asset);
    final price = asset.getPrice() * quantity;
    _performSellingOperation(asset, quantity, price);
    _resources += price;
    _assertsAndQuantities[asset] = _assertsAndQuantities[asset]! - quantity;
  }

  Future<void> buy(Asset asset, double quantity) async {
    final canBeBought = await _canBuy(asset, quantity);
    if (!canBeBought) throw NotEnoughResources();
    final price = asset.getPrice() * quantity;
    _performBuyingOperation(asset, quantity, price);
    _resources -= price;

    bool found = false;
    for (var k in _assertsAndQuantities.keys) {
      if (k.getSymbol() == asset.getSymbol() &&
          k.getName() == asset.getName()) {
        found = true;
        _assertsAndQuantities[k] = (_assertsAndQuantities[k]! + quantity);
        break;
      }
    }
    if (!found) {
      _assertsAndQuantities[asset] = quantity;
    }
  }

  void _performSellingOperation(Asset asset, double quantity, double price);
  void _performBuyingOperation(Asset asset, double quantity, double price);
}

class PlaygroundTradingPolicy extends TradingPolicy {
  PlaygroundTradingPolicy(double initVirtualMoneyAmount) : super(initVirtualMoneyAmount);

  @override
  void _performBuyingOperation(Asset asset, double quantity, double price) {
    // Nothing here on purpose
  }

  @override
  void _performSellingOperation(Asset asset, double quantity, double price) {
    // Nothing here on purpose
  }

}