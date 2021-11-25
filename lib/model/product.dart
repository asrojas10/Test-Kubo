import 'package:flutter/material.dart';

class Product {
  String image,
      title,
      descripcion,
      price,
      discount,
      id,
      cantidadDisp,
      fechaPromo;

  Product(
      {this.id,
      this.discount,
      this.image,
      this.price,
      this.title,
      this.cantidadDisp,
      this.descripcion,
      this.fechaPromo});

  Product.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      discount = json['valor_promo'];
      image = json['imagen'];
      price = json['precio'];
      title = json['nombre'];
      cantidadDisp = json['disponible'];
      descripcion = json['descripcion'];
      fechaPromo = json['fecha_promo'];
    }
  }
}
