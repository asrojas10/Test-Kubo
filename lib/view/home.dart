import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {},
        ));
  }
}
