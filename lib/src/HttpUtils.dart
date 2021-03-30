import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpUtils {
  String urlBase = "localhost:3000";
  String urlNamesSuffix = "users";

  void getNames() async{
    var uri = Uri.https(urlBase, urlNamesSuffix);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    else {
      throw Exception('Failed to fetch user names');
    }
  }
}