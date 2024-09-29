 
 

// class CartItem {
//   final String name;
//   final double price;
//   int quantity;
//   final String imageUrl; 
//   CartItem({required this.name, required this.price, required this.imageUrl, this.quantity = 1});
// }
class CartItem {
  final String name;
  final double price;
  int quantity;
  final String imageUrl; 

  CartItem({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}
