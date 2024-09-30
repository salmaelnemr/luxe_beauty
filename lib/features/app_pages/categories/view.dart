import 'package:flutter/material.dart';
import '../../../core/models/products_of_category_model.dart';
import '../../../dio/api_provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int selectedIndex = 0;
  List<String> categories = [];
  ProductsOfCategoryModel? productsOfCategoryModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  loadCategories() async {
    categories = await ApiProvider().getCategories();
    if (categories.isNotEmpty) {
      await loadProducts(
          categories[0]);
    }
    setState(() {
      isLoading = false;
    });
  }

  loadProducts(String category) async {
    setState(() {
      isLoading = true;
    });
    productsOfCategoryModel = await ApiProvider().getProductsByCategory(category);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
          ),
          width: double.infinity,
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
                            Icons.search,
                            size: 24,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.menu,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildCategoriesIcon(
                            category: categories[index], index: index),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 21,
                        ),
                        itemCount: categories.length,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => buildProductItem(
                            product: productsOfCategoryModel!.products![index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: productsOfCategoryModel!.products!.length,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildCategoriesIcon({required String category, required int index}) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        loadProducts(category);
      },
      child: Container(
        height: 30,
        width: 157,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: selectedIndex == index ? Colors.brown : Colors.white60,
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 14,
            color: selectedIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildProductItem({required Product product}) {
    return Container(
      height: 177,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: 19,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
              child: Image.network(
                product.thumbnail!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "price : ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "${product.price!.toString()} \$",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "category: ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  product.category!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
