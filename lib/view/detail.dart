import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_k/model/product.dart';
import 'package:test_k/provider/products_provider.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({Key key, this.product}) : super(key: key);

  ProductProvider proprovider = new ProductProvider();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: product.image,
                  height: 200,
                  width: 200,
                  alignment: Alignment.topCenter,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(product.title),
                SizedBox(
                  height: 30,
                ),
                Text(product.descripcion)
              ],
            ),
          )
        ],
      ),
    );
  }
}
