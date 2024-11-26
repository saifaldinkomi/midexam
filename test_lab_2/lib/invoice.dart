// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_lab_2/product.dart';

class Invoice {
  String Name;
  List<Product> products;
  Invoice({
    required this.Name,
    required this.products,
  });

  @override
  String str = "";
  double totalPrice = 0;
  int totalQuintity = 0;
  String toString() {
    for (int i = 0; i < products.length; i++) {
      str += " ${i+1}. ${products[i].toString()}\n";
      totalPrice += (products[i].Price * products[i].Quantity);
      totalQuintity += products[i].Quantity;
    }
    return "${str}\n\n\n\n\n\n\n\n\n\nTotal price: ${totalPrice}\nTotal quantity: ${totalQuintity}";
  }
}
