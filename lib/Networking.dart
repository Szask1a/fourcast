import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {

  Networking (this.url);

  final String url;

  Future <void> getData () async {

    http.Response response = await http.get(url);
    print(response.statusCode);

    if(response.statusCode == 200) {
      String data = response.body;
    } else {
      print(response.statusCode);
    }
  }
}