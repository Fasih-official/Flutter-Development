class ProductModel {
  String _title;
  String _description;
  double _price;
  String _image;
  bool _isFavorite;

  ProductModel(this._title, this._description, this._price, this._image,
      this._isFavorite);

  bool get isFavorite => _isFavorite;

  set isFavorite(bool value) {
    _isFavorite = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  @override
  String toString() {
    return 'ProductModel{_title: $_title, _description: $_description, _price: $_price, _image: $_image, _isFavorite: $_isFavorite}';
  }
}
