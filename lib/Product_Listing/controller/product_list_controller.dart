import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../models/product_list_model.dart';

class ProductController extends GetxController {
  RxList<ProductList> allProducts = <ProductList>[].obs;
  RxList<TextEditingController> itemQuanity = <TextEditingController>[].obs;

  Future<dynamic> getMethod() async {
    final response = await rootBundle.loadString('assets/product.json');
    final data = await jsonDecode(response);
    print('dataa  ' + '$data');
    allProducts.value = productListFromMap(data);
    itemQuanity = List<TextEditingController>.generate(
            allProducts.length, (int index) => TextEditingController(),
            growable: true)
        .obs;
    // ignore: invalid_use_of_protected_member
    itemQuanity.value = allProducts.map((e) => e.qty).toList();

    return allProducts;
  }
}
