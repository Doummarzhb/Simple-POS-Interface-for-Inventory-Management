import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_status_bar.dart';
import '/navbar.dart';
import 'package:management/pages/profile/profile_screen.dart';
import 'package:management/model/productcard/productcard.dart';
import 'package:management/model/cart/cart.dart';
import 'package:management/model/cart/cart_screen.dart'; 
import 'package:management/components/form_screen/form_screen.dart';
import 'package:management/model/productform.dart'; 

class HomeScreen extends StatefulWidget {
  final String email;
  final String password;

  const HomeScreen({super.key, required this.email, required this.password});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final Cart _cart = Cart();
  String _searchQuery = '';

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FormScreen()),
    );
  }

  List<Product> products = [
  // List of clothing products
  Product(
    name: 'T-Shirt',
    price: 15.0,
    imageUrl: 'https://th.bing.com/th/id/OIP.nVGcLHLGSQsUhn_9VmxhGgHaHa?pid=ImgDet&w=179&h=179&c=7&dpr=1.3', // Replace with a valid image URL
    description: 'Comfortable cotton t-shirt available in various colors.',
  ),
  Product(
    name: 'Jeans',
    price: 40.0,
    imageUrl: 'https://th.bing.com/th/id/OIP.-vXHSDgI6yHrGvVGDfwkZgHaIa?w=178&h=202&c=7&r=0&o=5&dpr=1.3&pid=1.7', // Replace with a valid image URL
    description: 'Stylish blue jeans that fit perfectly.',
  ),
  
  Product(
    name: 'Hoodie',
    price: 30.0,
    imageUrl: 'https://th.bing.com/th/id/OIP.lv0EPd1nBuCYkbrIwuL5VQHaJE?w=202&h=248&c=7&r=0&o=5&dpr=1.3&pid=1.7', // Replace with a valid image URL
    description: 'Warm and cozy hoodie, perfect for chilly days.',
  ),
  Product(
    name: 'Jacket',
    price: 80.0,
    imageUrl: 'https://th.bing.com/th/id/OIP.LC-x5V5CdChRR5Gii44bngHaHa?w=176&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', // Replace with a valid image URL
    description: 'Stylish jacket for any occasion.',
  ),
];

  // CustomStatusBar get customStatusBar => CustomStatusBar(
  //       batteryLevel: '90%', 
  //       isWifiConnected: true, 
  //     );

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            name: 'Username',
            email: widget.email,
            city: 'City',
            phoneNumber: 'Phone Number',
          ),
        ),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _purchaseProduct(Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Purchase Successful'),
          content: Text('You have purchased ${product.name}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _addProductToCart(Product product) {
    setState(() {
      _cart.addToCart(product);
    });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Added to Cart'),
          content: Text('${product.name} has been added to the cart.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete a product
  void _deleteProduct(Product product) {
    setState(() {
      products.remove(product); // Remove  
    });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Deleted'),
          content: Text('${product.name} has been removed from the products.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function  to add a new product
  void _addNewProduct() async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductFormScreen(),
      ),
    );
    if (newProduct != null) {
      setState(() {
        products.add(newProduct); // Add the new product to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = products
        .where((product) => product.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.bars),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0, top: 16.0, bottom: 16.0),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.commentDots),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.shoppingBag),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cart: _cart),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6.0),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.signOutAlt),
              onPressed: _logout,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // customStatusBar,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: const Icon(FontAwesomeIcons.plus),
              onPressed: _addNewProduct, //   add new product
              tooltip: 'Add New Product',
              iconSize: 30, // You can adjust the size
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    _purchaseProduct(product);
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Container(
                      width: 160,
                     
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image.asset(product.imageUrl, width: 120, height: 60),
                          Image.network(product.imageUrl, width: 200, height: 80),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.boxOpen, size: 16, color: Colors.grey),
                              SizedBox(width: 8),
                              Text(product.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 2),
                          Text('${product.price}\$', style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 2),
                           Text(
                  product.description,  
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                  maxLines: 2,  
                  overflow: TextOverflow.ellipsis,   
                ),
                           
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.trash),
                            onPressed: () => _deleteProduct(product), // Delete  
                            tooltip: 'Delete',
                          ),
                          IconButton(
                              icon: const Icon(FontAwesomeIcons.cartPlus), // Add icon for cart
                              onPressed: () {
                                _addProductToCart(product);
                              },
                              tooltip: 'Add to Cart',
                            ),
                          
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
