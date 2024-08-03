import 'package:flutter/material.dart';
import 'package:skin_care_app/features/app_info/view.dart';
import '../../../dio/api_provider.dart';
import '../../../models/products_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ApiProvider? apiProvider;
  ProductsModel? productsModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async {
    productsModel = await ApiProvider().getProduct();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.menu,
                          size: 24,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AppInformationView(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.info_outline_rounded,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Discover the \nnewest products',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: productsModel!.products!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 157 / 235,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) => buildCategories(
                          product: productsModel!.products![index]),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget buildCategories({required Product product}) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.brown,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.thumbnail!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.title!,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
      ],
    );
  }
}
