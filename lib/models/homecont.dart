// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_application_api/models/promodels.dart';
import 'package:flutter_application_api/services/homeservice.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Homecont extends GetxController {
  late Homeservice homeservice;

  List<Product> prodects = [];
  @override
  void onInit() {
    homeservice = Homeservice();
    getAllpro();
    super.onInit();
  }

  void getAllpro() async {
    try {
      http.Response r = await homeservice.getallproduct();
      if (r.statusCode == 200) {
        List<dynamic> data = jsonDecode(r.body);
        data.forEach((element) {
          prodects.add(Product.fromJson(element));
        });
        update();
      }
    } catch (e) {
      print(e);
    }
  }
}
