import 'package:flutter/material.dart';
import 'package:food/data/data_login.dart';
import 'package:food/model/food_item.dart';
import 'package:food/screens/homeScreen.dart';
import 'package:food/screens/individualItem.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';
import '../widgets/searchBar.dart';
import 'dart:convert' as convert;

class ListFoodScreen extends StatefulWidget {
  static const routeName = '/foodScreen';
  @override
  _ListFoodScreen createState() => _ListFoodScreen();
}

class _ListFoodScreen extends State<ListFoodScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchText = TextEditingController();
    List<FoodItem> listFoodItem = [];
    for (int i = 0; i < dataFood["result"].length; i++) {
      listFoodItem.add(FoodItem(dataFood["result"][i]["thumbnail"],
          dataFood["result"][i]["rating"], dataFood["result"][i]["name"]));
    }
    getSearchFood("pho");
    print("OOOOO");

    return Scaffold(
        body: FutureBuilder(
      future: getItem(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        print(dataFood);
        return Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: AppColor.primary,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Danh sách món ăn",
                                  style: Helper.getTheme(context).headline5,
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            Helper.getAssetName("cart.png", "virtual"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColor.placeholderBg,
                        ),
                        child: TextField(
                          controller: searchText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Image.asset(
                              Helper.getAssetName(
                                  "search_filled.png", "virtual"),
                            ),
                            hintText: "Tìm kiếm món ăn",
                            hintStyle: const TextStyle(
                              color: AppColor.placeholder,
                              fontSize: 18,
                            ),
                            contentPadding: const EdgeInsets.only(
                              top: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: listFoodItem.length,
                        itemBuilder: (context, pos) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => IndividualItem(
                                                id: dataFood["result"][pos]
                                                    ["id"],
                                                rating: dataFood["result"][pos]
                                                    ["rating"],
                                                decs: dataFood["result"][pos]
                                                    ["description"],
                                                price: dataFood["result"][pos]
                                                    ["price"],
                                                name: dataFood["result"][pos]
                                                    ["name"],
                                                image: dataFood["result"][pos]
                                                    ["thumbnail"],
                                              )));
                                },
                                child: RecentItemCard(
                                  image: Image.asset(
                                    Helper.getAssetName(
                                        listFoodItem[pos].image, "real"),
                                    fit: BoxFit.cover,
                                  ),
                                  name: listFoodItem[pos].name,
                                  rating: listFoodItem[pos].rating,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavBar(
                menu: true,
              ),
            ),
          ],
        );
      },
    ));
  }
}

class DessertCard extends StatelessWidget {
  const DessertCard({
    required String name,
    required String rating,
    required String shop,
    required Image image,
  })  : _name = name,
        _rating = rating,
        _shop = shop,
        _image = image;

  final String _name;
  final String _rating;
  final String _shop;
  final Image _image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: _image,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: Helper.getTheme(context).headline4!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Helper.getAssetName("star_filled.png", "virtual"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        _rating,
                        style: TextStyle(color: AppColor.orange),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        _shop,
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          ".",
                          style: TextStyle(color: AppColor.orange),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Desserts",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
