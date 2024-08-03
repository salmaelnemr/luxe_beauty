import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_care_app/models/products_of_category_model.dart';
import '../models/products_model.dart';
import '../models/user_model.dart';

class ApiProvider {
  ProductsModel? productsModel;
  static const String baseURL = "https://dummyjson.com";
  String? token;
  ProductsOfCategoryModel? productsOfCategoryModel;
  UserModel? userModel;

  Future<ProductsModel?> getProduct() async {
    try {
      Response response = await Dio().get(
        "$baseURL/products",
        queryParameters: {
          "select": "id,title,price,category,description,thumbnail",
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      productsModel = ProductsModel.fromJson(response.data);
      return productsModel;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserModel?> getUser() async {
    try {
      Response response = await Dio().get(
        "$baseURL/users/1",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      userModel = UserModel.fromJson(response.data);
      return userModel;
    } catch (e) {
      print(e);
    }
    return null;
  }


  Future<ProductsOfCategoryModel?> getProductsByCategory(String category) async {
    try {
      Response response = await Dio().get(
        "$baseURL/products/category/$category",
        queryParameters: {
          "select": "id,title,category,thumbnail,price",
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      productsOfCategoryModel = ProductsOfCategoryModel.fromJson(response.data);
      return productsOfCategoryModel;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<String>> getCategories() async {
    try {
      Response response = await Dio().get("$baseURL/products/category-list");
      List<String> categories = List<String>.from(response.data);
      return categories;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String> registerUser({
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      FormData userData = FormData.fromMap({
        "username": username,
        "password": password,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
      });
      Response response = await Dio().post(
        "$baseURL/auth/register",
        data: userData,
      );
      await prefs.setString("userToken", response.data["token"]);

      token = prefs.getString('userToken');
      return "Registration Success";
    } catch (e) {
      if (e is DioException) {
        return e.response?.data["message"];
      }
      return "Registration Failed";
    }
  }

  Future<String> userLogin({
    required String username,
    required String password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      FormData userData = FormData.fromMap({
        "username": username,
        "password": password,
      });
      Response response = await Dio().post(
        "$baseURL/auth/login",
        data: userData,
      );
      await prefs.setString("userToken", response.data["token"]);

      token = prefs.getString('userToken');
      return "Login Success";
    } catch (e) {
      if (e is DioException) {
        return e.response?.data["message"];
      }
      return "Login Failed";
    }
  }
}
