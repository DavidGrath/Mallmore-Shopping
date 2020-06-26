//TODO I need to find a way to securely store card data if I ever do cards irl

class CreditCard {
  String cardNumber;
  DateTime expiry;
  int cvv;
  String holderName;
  CreditCard({this.cardNumber, this.expiry, this.cvv, this.holderName});
}
