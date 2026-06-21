import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_models.dart';

class ProductDetailScreen extends StatefulWidget {
  final Data product;
  final Set<int> cartIds;
  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.cartIds,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Back")),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.product.id ?? 0,
                child: Image.network(
                  widget.product.image ?? '',
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name ?? '',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.product.tagline ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: 16),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.product.description ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.product.price ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600,
                      ),
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.cartIds.add(widget.product.id ?? 0);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Added to cart!"),
                            backgroundColor: Colors.green.shade600,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Buy Now",
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
            ],
          ),
        ),
      ),
    );
  }
}
