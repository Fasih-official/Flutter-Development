import 'package:flutter_app/models/ProductModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductScoppedModel extends Model {
  List<ProductModel> _productList = [
    ProductModel("Chocoloate", "So tasty", 189.56, "assets/download.jpg", false)
  ];

  bool isFavoriteModeOn = false;

  List<ProductModel> get productList {
    if (isFavoriteModeOn) {
      return List.from(
          _productList.where((ProductModel product) => product.isFavorite));
    }
    return List.from(_productList);
  }

  void addProduct(ProductModel product) {
    _productList.add(product);
    notifyListeners();
  }

  void updateProduct(ProductModel product, int position) {
    _productList[position] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    if (isFavoriteModeOn) {
      _productList.remove(
          _productList.where((prodcut) => prodcut.isFavorite).toList()[index]);
    } else {
      _productList.removeAt(index);
    }
    notifyListeners();
  }

  void notifyFavoriteListingMode(bool isFavoriteModeOn) {
    this.isFavoriteModeOn = isFavoriteModeOn;
    notifyListeners();
  }
}
