import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

List<dynamic> dataUser = [];
Future<bool> postLogin(String email, String password) async {
  var url = Uri.parse("http://10.0.2.2:8000/login");
  Map data2 = {
    "email": email,
    "password": password,
  };
  var body = convert.json.encode(data2);

  var headers = ({"Content-Type": "application/json"});

  var response = await http.post(url, headers: headers, body: body);
  print(response.body);
  var data = convert.jsonDecode(response.body);
  dataUser = data["result"];
  if (data["message"] == "Login successful") {
    return true;
  }
  return false;
}

Future<bool> postSignUp(String name, String email, String phone, String address,
    String password) async {
  var url = Uri.parse("http://10.0.2.2:8000/sign-up");
  Map data2 = {
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "password": password,
  };
  var body = convert.json.encode(data2);

  var headers = ({"Content-Type": "application/json"});

  var response = await http.post(url, headers: headers, body: body);
  print(response.body);
  var data = convert.jsonDecode(response.body);
  if (data["message"] == "Sign up successfully") {
    return true;
  }
  return false;
}

Future<dynamic> getItem() async {
  var client = HttpClient();
  HttpClientRequest request = await client.get('10.0.2.2', 8000, '/item');
  HttpClientResponse response = await request.close();
  String data = await response.transform(utf8.decoder).join();
  return data;
}

Future<dynamic> getCountItem() async {
  var client = HttpClient();
  HttpClientRequest request = await client.get('10.0.2.2', 8000, '/item');
  HttpClientResponse response = await request.close();
  String data = await response.transform(utf8.decoder).join();
  var r = convert.jsonDecode(data)["result"];
  print(r);
  // return data["result"];
}

Future<dynamic> getItemId(int id) async {
  var url = Uri.parse('localhost:8000/item/' + id.toString());
  var dataDevice;
  var response = await http.get(
    url,
  );
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    dataDevice = jsonResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return dataDevice;
}

Future<http.Response> postGetCart(String email, String password) async {
  var url = Uri.parse('localhost:8000/get-cart');
  Map data2 = {
    "email": email,
    "password": password,
  };
  var body = convert.json.encode(data2);

  var response = await http.post(url, body: body);
  return response;
}

Future<http.Response> postEditCart(
    String email, String phone, int id, int quality) async {
  var url = Uri.parse('localhost:8000/sign-up');
  Map data2 = {
    "email": email,
    "phone": phone,
    "detail": [
      {"id": id, "quality": quality}
    ]
  };
  var body = convert.json.encode(data2);

  var response = await http.post(url, body: body);
  return response;
}

Future<http.Response> postCreateBill(
    String email, String phone, int id, int quality) async {
  var url = Uri.parse('localhost:8000/sign-up');
  Map data2 = {
    "email": email,
    "phone": phone,
    "detail": [
      {"id": id, "quality": quality}
    ]
  };
  var body = convert.json.encode(data2);

  var response = await http.post(url, body: body);
  return response;
}
