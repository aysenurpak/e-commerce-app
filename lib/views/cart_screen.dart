import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_models.dart';
import 'package:e_commerce/views/product_detail_screen.dart';
import 'package:e_commerce/components/product_item_tile.dart';
import 'package:e_commerce/components/cart_item_tile.dart';

class CartScreen extends StatefulWidget {
  final Set<int> cartIds;
  final List<Data> products;

  const CartScreen({super.key, required this.cartIds, required this.products});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.products
        .where((product) => widget.cartIds.contains(product.id))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Cart")),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: cartProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 64,
                              color: Colors.grey.shade400,
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Your cart is empty",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade700,
                              ),
                            ),

                            SizedBox(height: 12),
                            Text(
                              "Add items to start shopping",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          final item = cartProducts[index];

                          return CartItemTile(
                            item: item,
                            onRemove: () {
                              setState(() {
                                widget.cartIds.remove(item.id);
                              });
                            },
                          );
                        },
                      ),
              ),

              SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey.shade600),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec accumsan placerat lorem nec rutrum. Proin posuere sollicitudin tincidunt. Nullam semper dolor vel sagittis dictum.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  // Implement checkout logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
