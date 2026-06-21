import 'package:e_commerce/models/product_models.dart';
import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final Data item;
  final VoidCallback onRemove;

  const CartItemTile({super.key, required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  item.image ?? '',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  item.tagline ?? '',
                  style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13, color: Colors.grey),
                ),
                Text(
                  item.price ?? '',
                  style:  TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: Colors.grey,
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
