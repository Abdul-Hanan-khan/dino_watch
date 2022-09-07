
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:watch_app/core/utils/api_constants.dart';

import 'package:watch_app/model/add_to_cart_model.dart';
import 'package:watch_app/model/all_brands_model.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/model/product_list_model.dart';
import 'package:watch_app/model/products_by_brand.dart';
import 'package:watch_app/model/signup.dart';
import 'package:watch_app/model/view_cart_model.dart';
import 'package:watch_app/model/watch_details_model.dart';
//
class HttpService {


  static Future<AuthModel?> uesrSignUp(String firstName,String lastName,String email,String username,String password,) async {
    try {
      var response = await http.post(
        Uri.parse(AppApis.signUp),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }
  static Future<AuthModel?> userLogin(String username,String userPassword,) async {
    try {
      var response = await http.post(
        Uri.parse(AppApis.login),
        body: {
          'username': username,
          'user_password': userPassword,
        },
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }



  static Future<List<Categories>?> getCategories() async {
    try {
      var response = await http.get(
        Uri.parse(AppApis.categories),

      );
      if (response.statusCode == 200) {
        List rawList = jsonDecode(response.body);
        return rawList.map((json) => Categories.fromJson(json)).toList();

      } else
        return null;
    }
    catch (e) {
      return null;
    }
  }

  static Future<ProductByCat?> getProductsByCategory({required String catId}) async {
    try {
      String url='https://dannidion.com/apies/productsbycategory.php?category_id=${catId??97}';
      print(url);
      var response = await http.post(
        Uri.parse(url),

      );
      if (response.statusCode == 200) {
        return ProductByCat.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }

  static Future<AddToCart?> addToCart({required String productID,int ?quantity}) async {
    try {
      String url='https://dannidion.com/apies/addtocart.php?productid=$productID&qty=${quantity??1}';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return AddToCart.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }
  static Future<ViewCartModel?> viewCart() async {
    try {
      String url='https://dannidion.com/apies/viewcart.php';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return ViewCartModel.fromJson(jsonDecode(response.body));

      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }

  static Future<WatchDetailsModel?> getWatchDetails({required String productID}) async {
    try {
      String url='https://dannidion.com/wp-json/wc/v3/products/$productID?consumer_key=ck_96d89bdadb96f00e78e0e2bc9d87a33e2fac45bf&consumer_secret=cs_6dda6a67adaa1decc82e07eac0d427965ea918c0';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return WatchDetailsModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }  static Future<AllBrands?> getAllBrands() async {
    try {
      String url='https://dannidion.com/apies/getallbrands.php';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return AllBrands.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }
  static Future<ProductByBrand?> getProductsByBrand(String termId) async {
    try {
      String url='https://dannidion.com/apies/productsbybrands.php?term_id=$termId';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return ProductByBrand.fromJson(jsonDecode(response.body));
      } else
        return null;
    }
    catch (e) {
      print(e);
      return null;
    }
  }



}