import 'cart_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_models.dart';

class ProductItemTile extends StatelessWidget {
  final Data product;

  const ProductItemTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product.id ?? 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  product.image ?? '',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 1),
                Text(
                  product.tagline ?? '',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                SizedBox(height: 1),
                Text(
                  product.price ?? '',
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
