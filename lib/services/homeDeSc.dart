// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_api/models/promodels.dart';
import 'package:flutter_application_api/services/homepage.dart';
import 'package:get/get.dart';

class HomeDetailS extends StatelessWidget {
  Product? product;
  HomeDetailS(this.product);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('product Info'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Homepage()));
            },
          ),
        ),
        body: Container(
          // color: Colors.cyan,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: size.height / 2,
                    width: size.width / 1,
                    child: Image.network(
                      product!.image.toString(),
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  Text(product!.title.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Price:\$ " + product!.price.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                    child: Text(product!.description.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text("ADD TO CART")),
                      ElevatedButton(
                          onPressed: () {}, child: Text("BUY IT NOW")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
