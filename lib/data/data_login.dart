import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:food/model/bill.dart';
import 'package:food/model/cart.dart';
import 'package:food/model/food_item.dart';
import 'package:http/http.dart' as http;

List<dynamic> dataUser = [];
List<dynamic> dataBillItem = [];
List<dynamic> dataBill = [];
List<dynamic> listSearch = [];
var dataFood;
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
  dataFood = json.decode(data);
  print(dataFood["message"]);
  return dataFood["result"];
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

Future<bool> postInfoUser(String name, String email, String phone,
    String address, String password) async {
  var url = Uri.parse("http://10.0.2.2:8000/edit-user");
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

Future<bool> postEditCart(
    String email, String phone, List<CartItem> listCartItem) async {
  var url = Uri.parse("http://10.0.2.2:8000/edit-cart");
  var r = [];
  for (CartItem x in listCartItem) {
    r.add(x.toJson());
  }
  Map data2 = {"email": email, "phone": phone, "detail": r};
  var body = convert.json.encode(data2);

  var headers = ({"Content-Type": "application/json"});

  var response = await http.post(url, headers: headers, body: body);
  print(response.body);
  var data = convert.jsonDecode(response.body);
  if (data["message"] == "Load successful") {
    return true;
  }
  return false;
}

Future<bool> postCreateBill(
    String email, String phone, List<Bill> listBill) async {
  var url = Uri.parse("http://10.0.2.2:8000/create-bill");
  var r = [];
  for (Bill x in listBill) {
    r.add(x.toJson());
  }
  Map data2 = {"email": email, "phone": phone, "detail": r};
  var body = convert.json.encode(data2);

  var headers = ({"Content-Type": "application/json"});

  var response = await http.post(url, headers: headers, body: body);
  print(response.body);
  var data = convert.jsonDecode(response.body);
  if (data["message"] == "Create bill successful") {
    return true;
  }
  return false;
}

Future<dynamic> getBill(String email, String phone) async {
  var url = Uri.parse('http://10.0.2.2:8000/get-bill');
  Map data2 = {
    "email": email,
    "phone": phone,
  };
  var body = convert.json.encode(data2);
  var headers = ({"Content-Type": "application/json"});
  var response = await http.post(url, headers: headers, body: body);
  var data = convert.jsonDecode(response.body);
  dataBill = data["result"];
  print("PPPP");
  print(dataBill);
  return dataBill;
}

Future<bool> postEditUser(String email, String phone, String name,
    String address, String pass) async {
  var url = Uri.parse("http://10.0.2.2:8000/edit-user");
  Map data2 = {
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "password": pass
  };
  var body = convert.json.encode(data2);
  print(body);
  var headers = ({"Content-Type": "application/json"});

  var response = await http.post(url, headers: headers, body: body);
  print(response.body);
  var data = convert.jsonDecode(response.body);
  if (data["message"] == "Edit successful") {
    return true;
  }
  return false;
}

Future<dynamic> getSearchFood(String text) async {
  var url = Uri.parse('http://10.0.2.2:8000/search_food/?name=' + text);
  var response = await http.get(url);
  var data = convert.jsonDecode(response.body);
  listSearch = data["result"];
  return listSearch;
}
