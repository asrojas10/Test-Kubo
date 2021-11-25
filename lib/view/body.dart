import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_k/model/product.dart';
import 'package:test_k/provider/products_provider.dart';
import 'package:test_k/view/detail.dart';
import 'package:http/http.dart' as http;
import 'package:test_k/widget/search.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  String query = "";
  List<Product> _products = List<Product>();
  List<Product> _productSearch;
  ProductProvider proprovider = new ProductProvider();
  @override
  void initState() {
    proprovider.fetchProducts().then((value) {
      setState(() {
        _products.addAll(value);
      });
    });
    super.initState();
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Buscar',
        onChanged: searchProduct,
      );

  void searchProduct(String query) {
    final prods = _products.where((x) {
      final titleLower = x.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    if (prods != null) {
      setState(() {
        this.query = query;
        this._products = prods;
      });
    } else {
      initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_products.isEmpty) {
      return CircularProgressIndicator();
    }
    return ListView(
      children: <Widget>[
        buildSearch(),
        GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 40,
            mainAxisExtent: 200,
            mainAxisSpacing: 20,
          ),
          itemCount: query != null ? _products.length : _productSearch.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(product: _products[i]))),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        imageUrl: _products[i].image,
                        height: 90,
                        width: 90,
                      ),
                    ),
                    Text(_products[i].title, textAlign: TextAlign.left),
                    Text(_products[i].price.toString(),
                        textAlign: TextAlign.justify),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite),
                          color: Colors.grey,
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        IconButton(
                          icon: Icon(Icons.shopping_basket),
                          color: Colors.grey,
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
