import 'package:flutter/material.dart';
import '../core/models/products_of_category_model.dart';
import '../dio/api_provider.dart';

class CategoriesIcon extends StatefulWidget {
  const CategoriesIcon({
    super.key,
    required buildCategoriesItem ,
  });

  @override
  State<CategoriesIcon> createState() => _CategoriesIconState();
}

class _CategoriesIconState extends State<CategoriesIcon> {
  int selectedIndex = 0;
  ProductsOfCategoryModel? productsOfCategoryModel;
  bool isLoading = true;
  loadProducts(String category) async {
    setState(() {
      isLoading = true;
    });
    productsOfCategoryModel =
        await ApiProvider().getProductsByCategory(category);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
}
