class Product {
  String Name;
  int Quantity;
  double Price;
  Product({
    required this.Name,
    required this.Quantity,
    required this.Price,
  });
 

  @override
  String toString() => '$Name, Quantity: $Quantity, Price: $Price';
}
