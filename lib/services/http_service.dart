import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:watch_app/core/utils/api_constants.dart';
import 'package:watch_app/core/utils/app_string.dart';

import 'package:watch_app/model/add_to_cart_model.dart';
import 'package:watch_app/model/all_brands_model.dart';
import 'package:watch_app/model/all_colors_model.dart';
import 'package:watch_app/model/country_list_model.dart';
import 'package:watch_app/model/edit_profile_model.dart';
import 'package:watch_app/model/my_orders_model.dart';
import 'package:watch_app/model/order_detials_model.dart';
import 'package:watch_app/model/place_order_model.dart';
import 'package:watch_app/model/product_by_cat_model.dart';
import 'package:watch_app/model/product_list_model.dart';
import 'package:watch_app/model/products_by_brand.dart';
import 'package:watch_app/model/search_model.dart';
import 'package:watch_app/model/signup.dart';
import 'package:watch_app/model/states_by_country_code.dart';
import 'package:watch_app/model/view_cart_model.dart';
import 'package:watch_app/model/watch_details_model.dart';
import 'package:watch_app/presentation/dashboard/shopping_cart/shopping_cart_controller.dart';
import 'package:watch_app/presentation/widgets/alertDialog.dart';

//
class HttpService {
  ShoppingCartController cartController = Get.find();

  static Future<AuthModel?> uesrSignUp(
      BuildContext context,
    String firstName,
    String lastName,
    String email,
    String username,
    String password,
  ) async {
    try {
      var headers = {
        'Cookie':
            'tk_ai=jetpack%3AX%2BCJfdiFCnjGbMbUrRhfbkKT; wordpress_logged_in_96f6aaa319a7fadc18ae17fe56f82271=shahid01%7C1665293508%7CgVjLnh2GCJ5Maw3oDsUoypza5c7c3PCZRPFz1mPFIor%7C4d6cf411cd030355a7dc365098dda2883dc2eefd1aaf09c028ab52a23eec08c6'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://dannidion.com/apies/user-accounts.php'));
      request.fields.addAll({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'username': username,
        'password': password
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp = await response.stream.bytesToString();
        var response2 = json.decode(temp);
        if (response2['status'] == "success") {
          return AuthModel.fromJson(response2);
        } else {
          showDialog(
              context: context,
              builder: (_) => AlertDialogWidget(onPositiveClick: (){Get.back();},title: "Error",subTitle: "Something Went Wrong. Please Try Again a While",)
          );

          return AuthModel();
        }
      } else {
        print(response.reasonPhrase);
      }
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
      var headers = {
        'Cookie':
            'tk_ai=jetpack%3AX%2BCJfdiFCnjGbMbUrRhfbkKT; wordpress_logged_in_96f6aaa319a7fadc18ae17fe56f82271=shabbir2022%7C1665292507%7CV9fpAFG6MMKebBG36wVA8ipcO22MQcsPqUU9h1Jixjm%7C12fabf4d15454a46d289c3159d4f404cdd9cc965556c13ad5630b5e576e92332'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://dannidion.com/apies/login.php'));
      request.fields
          .addAll({'username': username, 'user_password': userPassword});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp = await response.stream.bytesToString();
        var response2 = json.decode(temp);
        if (response2['status'] == "success") {
          return AuthModel.fromJson(response2);
        } else {
          return AuthModel();
        }
      } else {
        print(response.reasonPhrase);
        return AuthModel();
      }

      // var response = await http.post(
      //   Uri.parse(AppApis.login),
      //   body: {
      //     'username': username,
      //     'user_password': userPassword,
      //   },
      // );
      // if (response.statusCode == 200) {
      //   print(response.body);
      //   Map<String, dynamic> data = jsonDecode(response.body);
      //   // print("response "+ data["status"]);
      //   if (data["status"] == 'success') {
      //     return AuthModel.fromJson(jsonDecode(response.body));
      //   } else {
      //     return AuthModel();
      //   }
      // } else
      //   return null;
    } catch (e) {
      print(e);
      return AuthModel();
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
      List<Map<String, dynamic>> itemsList = [];
      for (var element in items) {
        itemsList.add({
          "product_id": element.id.toString(),
          "product_name": element.name,
          "product_price": int.parse(element.price.toString()),
          "product_qty": element.productQuantity!.value
        });
      }
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('https://dannidion.com/apies/place_order.php'));
      request.body = json.encode({
        "user_id": userid,
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
        var temp = await response.stream.bytesToString();
        var response2 = json.decode(temp);
        return PlaceOrderModel.fromJson(response2);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('place order api error');
      print(e);
      return null;
    }
  }




  // static Future<MyOrdersModel?> allMyOrders(String userId) async {
  //   var client = Dio();
  //
  //   final url = 'https://dannidion.com/apies/myorders.php?userid=$userId';
  //   try {
  //     final response = await client.get(url);
  //
  //     if (response.statusCode == 200) {
  //       return MyOrdersModel.fromJson(response.data);
  //     } else {
  //       print('${response.statusCode} : ${response.data.toString()}');
  //       return MyOrdersModel();
  //       // throw response.statusCode;
  //     }
  //   } catch (error) {
  //     print(error);
  //     return MyOrdersModel();
  //   }
  // }




  // static Future<MyOrdersModel?> allMyOrders(
  //     String userId) async {
  //   try {
  //     String url = 'https://dannidion.com/apies/myorders.php?userid=$userId';
  //     print(url);
  //     var response = await http.get(
  //       Uri.parse(url),
  //     );
  //     if (response.statusCode == 200) {
  //       return MyOrdersModel.fromJson(jsonDecode(response.body));
  //     } else
  //       return null;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }



  // static Future<MyOrdersModel> allMyOrders(String userId) async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse("https://dannidion.com/apies/myorders.php?userid=$userId'"),
  //     );
  //     if (response.statusCode == 200) {
  //       return MyOrdersModel.fromJson(jsonDecode(response.body));
  //
  //     } else {
  //       return MyOrdersModel();
  //     }
  //   }
  //   catch (e) {
  //     return MyOrdersModel();
  //   }
  // }

  static Future<MyOrdersModel?> getAllOrders(String userId,String orderType) async {
    try {
      var request = http.Request('GET',
          Uri.parse('https://dannidion.com/apies/myorders.php?$userId=13&ordertype=${orderType??"all"}'));
      var headers = {
        'Accept': '*/*',
      };
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var temp = await response.stream.bytesToString();
        var decodedResponse = json.decode(temp);
        log("json decoded response"+decodedResponse.toString());
        return MyOrdersModel.fromJson(decodedResponse);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<dynamic> addReview({
    required String userId,
    required String productId,
    required int rating,
    required String commentContent,
  }) async {
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse('https://dannidion.com/apies/addproductrating.php'));
      request.fields.addAll({
        'user_id': userId,
        'product_id': productId,
        'rating': '$rating',
        'comment_content': commentContent
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp = await response.stream.bytesToString();
        var decodedResponse = json.decode(temp);
        return decodedResponse;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<EditProfileModel?> editProfile(
      {String? userId,
      String? firstName,
      String? lastName,
      String? image}) async {
    try {
      var headers = {
        'Cookie':
            'wordpress_logged_in_96f6aaa319a7fadc18ae17fe56f82271=hanan1%7C1663522095%7C8N7fRjguvwuMW6PBEOCIDrX0AU9kwASJ5lbJ2cKqjFW%7Cbb81bffc69256ea415fdd5281400bc756da657b25fcca1919415c07e03376dca'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://dannidion.com/apies/editprofile.php'));
      request.fields.addAll({
        'userid': userId!,
        'first_name': firstName!,
        'last_name': lastName!
      });
      if (image != '') {
        request.files
            .add(await http.MultipartFile.fromPath('profile_image', image!));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp = await response.stream.bytesToString();
        var decodedResponse = json.decode(temp);
        return EditProfileModel.fromJson(decodedResponse);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  static Future<OrderDetailsModel?> loadOrderDetails(String orderId) async {
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://dannidion.com/wc-api/v3/orders/$orderId?consumer_key=ck_96d89bdadb96f00e78e0e2bc9d87a33e2fac45bf&consumer_secret=cs_6dda6a67adaa1decc82e07eac0d427965ea918c0'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp = (await response.stream.bytesToString());
        var decodedResponse = json.decode(temp);
        return OrderDetailsModel.fromJson(decodedResponse);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  static Future<dynamic?> forgotPassword(String userEmail) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://dannidion.com/apies/forgotpassword.php'));
      request.fields.addAll({'useremail': userEmail});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp = (await response.stream.bytesToString());
        var decodedResponse = json.decode(temp);
        return (decodedResponse);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  static Future<AllColors?> getAllColors() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('https://dannidion.com/apies/getallcolors.php'));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp = (await response.stream.bytesToString());
        var decodedResponse = json.decode(temp);
        return AllColors.fromJson(decodedResponse);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  static Future<SearchModel?> search(String searchString, String slug) async {
    try {
      var headers = {
        'Cookie':
            'wordpress_logged_in_96f6aaa319a7fadc18ae17fe56f82271=hanan2%7C1664014640%7Cb0r6nfVdLwehGVlmTUWK5LFrGaEQfxNZmyLgbjEJpVB%7C11391f4b87d9c347194e23a1af6be8fda21eb25b4dccf1f64c2bd7d64689c82a'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://dannidion.com/apies/productsearch.php'));
      request.fields.addAll(
        {'keyword': searchString, 'color': slug ?? ''},
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var temp = (await response.stream.bytesToString());
        var decodedResponse = json.decode(temp);
        return SearchModel.fromJson(decodedResponse);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }
}
