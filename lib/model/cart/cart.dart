import './cart_item.dart';
import 'package:management/model/productcard/productcard.dart';

class Cart {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;            
    }
    return total;
  }

  void addToCart(Product product) {
    CartItem? existingItem;
    try {
      existingItem = _items.firstWhere((item) => item.name == product.name);
    } catch (e) {
      existingItem = null;
    }

    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      _items.add(CartItem(name: product.name, price: product.price, imageUrl: product.imageUrl)); // تأكد من تمرير imageUrl
    }
  }

  void removeFromCart(CartItem item) {
    _items.remove(item);
  }
}
