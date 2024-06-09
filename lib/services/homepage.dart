// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_api/appbar/appbar.dart';
import 'package:flutter_application_api/controller/homecont.dart';
import 'package:flutter_application_api/services/homeDeSc.dart';
import 'package:flutter_application_api/models/promodels.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Homecont homecont = Get.put(Homecont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home Page'), actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ]),
        drawer: AppDrawer(),
        body: GetBuilder<Homecont>(builder: (_) {
          return ListView.separated(
              itemBuilder: (context, index) {
                Product product = homecont.prodects[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HomeDetailS(product)));
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Center(
                            child: Image.network(
                              product.image.toString(),
                              height: 250,
                              width: 200,
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(product.title.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Text("Price: \$" + product.price.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                //fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black.withOpacity(0.05),
                  ),
              itemCount: homecont.prodects.length);
        }));
  }
}
