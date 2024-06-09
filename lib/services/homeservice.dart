import 'package:http/http.dart' as http;

class Homeservice {
  Future<http.Response> getallproduct() async {
    String url = "https://fakestoreapi.com/products";
    http.Response respon = await http.get(Uri.parse(url));
    return respon;
  }
}
