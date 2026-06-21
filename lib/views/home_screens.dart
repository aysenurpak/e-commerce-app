import 'package:e_commerce/components/product_item_tile.dart';
import 'package:e_commerce/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product_models.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  List<Data> allProducts = [];
  bool isLoading = false;
  String errorMessage = '';
  Set<int> cartIds = {};

  Future<void> loadProducts() async {
    try {
      setState(() {
        isLoading = true;
      });

      final products = await apiService.fetchProducts();

      setState(() {
        allProducts = products.data ?? [];
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load products';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    iconSize: 32,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            cartIds: cartIds,
                            products: allProducts,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search for products",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://wantapi.com/assets/banner.png",
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: allProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final product = allProducts[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              product: product,
                              cartIds: cartIds,
                            ),
                          ),
                        );
                      },
                      child: ProductItemTile(product: product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
