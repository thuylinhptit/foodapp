import 'package:flutter/material.dart';
import 'package:food/data/data_login.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';
import '../screens/individualItem.dart';
import '../widgets/searchBar.dart';
import 'listFoodScreen.dart';
import 'myOrderScreen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getItem(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // print(dataFood);
          if (snapshot.hasData) {
            return Scaffold(
              body: Stack(
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Chào buổi sáng!",
                                  style: Helper.getTheme(context).headline5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(MyOrderScreen.routeName);
                                    },
                                    child: Image.asset(Helper.getAssetName(
                                        "cart.png", "virtual")))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text("Chọn địa điểm"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: SizedBox(
                                width: 250,
                                child: DropdownButton(
                                  value: "vị trí hiện tại",
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text("Vị trí hiện tại"),
                                      value: "vị trí hiện tại",
                                    ),
                                  ],
                                  icon: Image.asset(
                                    Helper.getAssetName(
                                        "dropdown_filled.png", "virtual"),
                                  ),
                                  style: Helper.getTheme(context).headline4,
                                  onChanged: (_) {},
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SearchBar(
                            title: "Tìm kiếm món ăn",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  CategoryCard(
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "hamburger2.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Offers",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CategoryCard(
                                    image: Image.asset(
                                      Helper.getAssetName("rice2.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Sri Lankan",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CategoryCard(
                                    image: Image.asset(
                                      Helper.getAssetName("fruit.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Italian",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CategoryCard(
                                    image: Image.asset(
                                      Helper.getAssetName("rice.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Indian",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Cửa hàng nổi bật",
                                  style: Helper.getTheme(context).headline5,
                                ),
                                TextButton(
                                    onPressed: () {}, child: Text("Xem tất cả"))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Press");
                              Navigator.of(context)
                                  .pushNamed(ListFoodScreen.routeName);
                            },
                            child: RestaurantCard(
                              image: Image.asset(
                                Helper.getAssetName("pizza2.jpg", "real"),
                                fit: BoxFit.cover,
                              ),
                              name: "NaCl",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Press");
                              Navigator.of(context)
                                  .pushNamed(ListFoodScreen.routeName);
                            },
                            child: RestaurantCard(
                              image: Image.asset(
                                Helper.getAssetName("breakfast.jpg", "real"),
                                fit: BoxFit.cover,
                              ),
                              name: "Đồ ăn nhanh",
                            ),
                          ),
                          RestaurantCard(
                            image: Image.asset(
                              Helper.getAssetName("bakery.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Bánh ngọt",
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Phổ biến nhất",
                                  style: Helper.getTheme(context).headline5,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Xem tất cả"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 250,
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  MostPopularCard(
                                    image: Image.asset(
                                      Helper.getAssetName("pizza4.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                    name: "Pizza",
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  MostPopularCard(
                                    name: "Burger",
                                    image: Image.asset(
                                      Helper.getAssetName(
                                          "dessert3.jpg", "real"),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Món ăn gần bạn",
                                  style: Helper.getTheme(context).headline5,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text("Xem tất cả"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: dataFood["result"].length,
                                  itemBuilder: (context, pos) {
                                    return GestureDetector(
                                      onTap: () {
                                        print("press");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    IndividualItem(
                                                      id: dataFood["result"]
                                                          [pos]["id"],
                                                      rating: dataFood["result"]
                                                          [pos]["rating"],
                                                      decs: dataFood["result"]
                                                          [pos]["description"],
                                                      price: dataFood["result"]
                                                          [pos]["price"],
                                                      name: dataFood["result"]
                                                          [pos]["name"],
                                                      image: dataFood["result"]
                                                          [pos]["thumbnail"],
                                                    )));
                                      },
                                      child: RecentItemCard(
                                        image: Image.asset(
                                          Helper.getAssetName(
                                              dataFood["result"][pos]
                                                  ["thumbnail"],
                                              "real"),
                                          fit: BoxFit.cover,
                                        ),
                                        name: dataFood["result"][pos]["name"],
                                        rating: dataFood["result"][pos]
                                            ["rating"],
                                      ),
                                    );
                                  })),
                          SizedBox(
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
                        home: true,
                      )),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    required String name,
    required Image image,
    required double rating,
  })  : _name = name,
        _rating = rating,
        _image = image;

  final String _name;
  final Image _image;
  final double _rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            child: _image,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context)
                      .headline4!
                      .copyWith(color: AppColor.primary),
                ),
                Row(
                  children: [
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Western Food"),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      _rating.toString(),
                      style: TextStyle(
                        color: AppColor.orange,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('(124) Đánh giá')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({
    required String name,
    required Image image,
  })  : _name = name,
        _image = image;

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 300,
            height: 200,
            child: _image,
          ),
        ),
        SizedBox(height: 10),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline4!
              .copyWith(color: AppColor.primary),
        ),
        Row(
          children: [
            Text("Cafe"),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                ".",
                style: TextStyle(
                  color: AppColor.orange,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text("Western Food"),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              Helper.getAssetName("star_filled.png", "virtual"),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "4.9",
              style: TextStyle(
                color: AppColor.orange,
              ),
            )
          ],
        )
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    required String name,
    required Image image,
  })  : _image = image,
        _name = name;

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: _image),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _name,
                      style: Helper.getTheme(context).headline3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("star_filled.png", "virtual"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                        color: AppColor.orange,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("(124 đánh giá)"),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Western Food"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required Image image,
    required String name,
  })  : _image = image,
        _name = name;

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 100,
            height: 100,
            child: _image,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline4!
              .copyWith(color: AppColor.primary, fontSize: 16),
        ),
      ],
    );
  }
}
