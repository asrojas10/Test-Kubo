import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_k/model/product.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  List<Product> _products = List<Product>();
  Future<List<Product>> fetchProducts() async {
    var url =
        'https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/';

    var response = await http.get(url);

    var products = List<Product>();

    if (response.statusCode == 200) {
      Map<String, dynamic> productsJson = json.decode(response.body);
      print(json.decode(response.body).runtimeType);

      List<dynamic> data = productsJson["data"];
      print(data[0]["nombre"]);
      for (var prodJson in data) {
        products.add(Product.fromJson(prodJson));
      }
    }
    print(products[0].title);
    print(products);
    return products;
  }
}
