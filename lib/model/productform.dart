import 'package:flutter/material.dart';
import 'package:management/model/productcard/productcard.dart';

class ProductFormScreen extends StatefulWidget {
  final Product? product;              

  const ProductFormScreen({Key? key, this.product}) : super(key: key);

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();

  //data 
  late String name;
  late double price;
  late String imageUrl;
  late String description;

  @override
  void initState() {
    super.initState();

     // eza product ken mawjod 
    if (widget.product != null) {
      name = widget.product!.name;
      price = widget.product!.price;
      imageUrl = widget.product!.imageUrl;
      description = widget.product!.description;
    } else {
      name = '';
      price = 0.0;
      imageUrl = '';
      description = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product != null ? 'Edit Product' : 'Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: '  product name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' Please enter product name';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                initialValue: price.toString(),
                decoration: InputDecoration(labelText: 'price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product price';
                  }
                  return null;
                },
                onSaved: (value) => price = double.parse(value!),
              ),
              TextFormField(
                initialValue: imageUrl,
                decoration: InputDecoration(labelText: 'Image Url '),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter image URL';
                  }
                  return null;
                },
                onSaved: (value) => imageUrl = value!,
              ),
              TextFormField(
                initialValue: description,
                decoration: InputDecoration(labelText: 'Descritipon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product description';
                  }
                  return null;
                },
                onSaved: (value) => description = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // add , edit      
                    Navigator.pop(context, Product(
                      name: name,
                      price: price,
                      imageUrl: imageUrl,
                      description: description,
                    ));
                  }
                },
                child: Text(widget.product != null ? 'Edit Product' : 'Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
