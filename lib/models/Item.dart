import './Review.dart';

class Item {
  String _name;
  String _brand;
  String _currencyCode;
  double _price;
  double _rating;
  int _quantity;
  String _image;
  List<int> _categories;
  //TODO Handle empty default as optional parameter
  List<Review> reviews;

  Item(
    this._name,
    this._brand,
    this._currencyCode,
    this._price,
    this._rating,
    this._quantity,
    this._categories, [
    this._image,
  ]);

  String get name => _name;
  String get brand => _brand;
  String get currencyCode => _currencyCode;
  double get price => _price;
  double get rating => _rating;
  int get quantity => _quantity;
  String get image => _image;
  List<int> get categories => _categories;
}
