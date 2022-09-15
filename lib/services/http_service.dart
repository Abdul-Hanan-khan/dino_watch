import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:watch_app/core/utils/api_constants.dart';

import 'package:watch_app/model/add_to_cart_model.dart';
import 'package:watch_app/model/all_brands_model.dart';
import 'package:watch_app/model/country_list_model.dart';
import 'package:watch_app/model/place_order_model.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/model/product_list_model.dart';
import 'package:watch_app/model/products_by_brand.dart';
import 'package:watch_app/model/signup.dart';
import 'package:watch_app/model/states_by_country_code.dart';
import 'package:watch_app/model/view_cart_model.dart';
import 'package:watch_app/model/watch_details_model.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';

//
class HttpService {
  ShoppingCartController cartController = Get.find();

  static Future<AuthModel?> uesrSignUp(
    String firstName,
    String lastName,
    String email,
    String username,
    String password,
  ) async {
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
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<AuthModel?> userLogin(
    String username,
    String userPassword,
  ) async {
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
    } catch (e) {
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
    } catch (e) {
      return null;
    }
  }

  static Future<ProductByCat?> getProductsByCategory(
      {required String catId}) async {
    try {
      String url =
          'https://dannidion.com/apies/productsbycategory.php?category_id=${catId ?? 97}';
      print(url);
      var response = await http.post(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return ProductByCat.fromJson(jsonDecode(response.body));
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<AddToCart?> addToCart(
      {required String productID, int? quantity}) async {
    try {
      String url =
          'https://dannidion.com/apies/addtocart.php?productid=$productID&qty=${quantity ?? 1}';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return AddToCart.fromJson(jsonDecode(response.body));
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<ViewCartModel?> viewCart() async {
    try {
      String url = 'https://dannidion.com/apies/viewcart.php';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return ViewCartModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<WatchDetailsModel?> getWatchDetails(
      {required String productID}) async {
    try {
      String url =
          'https://dannidion.com/wp-json/wc/v3/products/$productID?consumer_key=ck_96d89bdadb96f00e78e0e2bc9d87a33e2fac45bf&consumer_secret=cs_6dda6a67adaa1decc82e07eac0d427965ea918c0';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return WatchDetailsModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<AllBrands?> getAllBrands() async {
    try {
      String url = 'https://dannidion.com/apies/getallbrands.php';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return AllBrands.fromJson(jsonDecode(response.body));
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<ProductByBrand?> getProductsByBrand(String termId) async {
    try {
      String url =
          'https://dannidion.com/apies/productsbybrands.php?term_id=$termId';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return ProductByBrand.fromJson(jsonDecode(response.body));
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<StatesByCountryCodeModel?> getStatesByCountryCode(
      String countryCode) async {
    try {
      String url =
          'https://dannidion.com/wp-json/wc/v3/data/countries/$countryCode?consumer_key=ck_96d89bdadb96f00e78e0e2bc9d87a33e2fac45bf&consumer_secret=cs_6dda6a67adaa1decc82e07eac0d427965ea918c0';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return StatesByCountryCodeModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<CountryListModel>?> getCountries() async {
    Uri _uri = Uri.parse(
        'https://dannidion.com/wp-json/wc/v3/data/countries?consumer_key=ck_96d89bdadb96f00e78e0e2bc9d87a33e2fac45bf&consumer_secret=cs_6dda6a67adaa1decc82e07eac0d427965ea918c0');
    try {
      var response = await http.get(
        _uri,
      );
      if (response.statusCode == 200) {
        List rawList = jsonDecode(response.body);
        print("countries fetched");
        return rawList.map((json) => CountryListModel.fromJson(json)).toList();
      } else
        return null;
    } catch (e) {
      return null;
    }
  }

  static Future<PlaceOrderModel?> placeOrder(
      {required String userid,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String address,
      required String country,
      required String state,
      required String postCode,
      required List<WatchDetailsModel> items}) async {
    try {

      List<Map<String,dynamic>> itemsList=[];
      for (var element in items) {
        itemsList.add({
          "product_id": element.id.toString(),
          "product_name": element.name,
          "product_price": int.parse(element.price.toString()),
          "product_qty": element.productQuantity!.value
        });

      }
     //  // print(itemsList);
     //
     //  // print(itemsList);
     // // var orderDetails= json.encode(itemsList);
     // //  print(orderDetails);
     //  var headers = {
     //    'Content-Type': 'application/json'
     //  };
     //  var request = http.Request('POST', Uri.parse('https://dannidion.com/apies/place_order.php'));
     //  request.body = json.encode({
     //    "user_id": "13",
     //    "reference_id": 1290824643,
     //    "shiping_first_name": "Shabbir",
     //    "shiping_last_name": "Ahmad",
     //    "shiping_email": "billing@yahoo.com",
     //    "shiping_phone": "03214031256",
     //    "shiping_address": "shiping address fsdfsdfsdf",
     //    "shiping_country": "PAK",
     //    "shiping_state": "Punjab",
     //    "shiping_post_code": "5400",
     //    "items_list":[
     //      {
     //        "product_id": "9017",
     //        "product_name": "Rolex Submariner Series 116618lb-0003",
     //        "product_price": 525,
     //        "product_qty": 1
     //      },
     //      {
     //        "product_id": "8939 ",
     //        "product_name": "Hublot Classic Fusion Chronograph 521.OX.7080.LR Watch",
     //        "product_price": 525,
     //        "product_qty": 1
     //      }
     //    ]
     //  });
     //  request.headers.addAll(headers);
     //
     //  http.StreamedResponse response = await request.send();
     //
     //  if (response.statusCode == 200) {
     //    // print(await response.stream.bytesToString());
     //    var temp = await response.stream.bytesToString();
     //    var response1=json.decode(temp);
     //    print(response1);
     //  }
     //  else {
     //    print(response.reasonPhrase);
     //  }
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('https://dannidion.com/apies/place_order.php'));
      request.body = json.encode({
        "user_id": "13",
        "reference_id": 1290824643,
        "shiping_first_name": "Shabbir",
        "shiping_last_name": "Ahmad",
        "shiping_email": "billing@yahoo.com",
        "shiping_phone": "03214031256",
        "shiping_address": "shiping address fsdfsdfsdf",
        "shiping_country": "PAK",
        "shiping_city": "Lahore",
        "shiping_state": "Punjab",
        "shiping_post_code": "5400",
        "items_list": itemsList
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp=await response.stream.bytesToString();
        var response2=json.decode(temp);
        return PlaceOrderModel.fromJson(response2);
      }
      else {
        print(response.reasonPhrase);
      }



    } catch (e) {
      print('place order api error');
      print(e);
      return null;
    }
  }
}
