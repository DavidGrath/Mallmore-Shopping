class Item {
  String _name;
  String _brand;
  String _currencyCode;
  double _price;
  double _rating;
  int _quantity;
  String _image;
  Item(
    this._name,
    this._brand,
    this._currencyCode,
    this._price,
    this._rating,
    this._quantity,
    [this._image,]
  );
}