import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

Future<http.Response> postLogin(String email, String password) async {
  var url = Uri.parse("http://192.168.1.109:8000/login");
  Map data2 = {
    "email": email,
    "password": password,
  };
  var body = convert.json.encode(data2);

  var response = await http.post(url, body: body);
  return response;
}

Future<http.Response> postSignUp(String name, String email, String phone,
    String address, String password) async {
  var url = Uri.parse('localhost:8000/sign-up');
  Map data2 = {
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "password": password,
  };
  var body = convert.json.encode(data2);

  var response = await http.post(url, body: body);
  return response;
}

Future<dynamic> getItem() async {
  var url = Uri.parse('localhost:8000/item');
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
