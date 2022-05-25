import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';
import 'checkoutScreen.dart';

class MyOrderScreen extends StatelessWidget {
  static const routeName = "/myOrderScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Giỏ hàng của bạn",
                        style: Helper.getTheme(context).headline5,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 80,
                            width: 80,
                            child: Image.asset(
                              Helper.getAssetName("hamburger.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "King Burgers",
                              style: Helper.getTheme(context).headline3,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Helper.getAssetName(
                                    "star_filled.png",
                                    "virtual",
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "4.9",
                                  style: TextStyle(
                                    color: AppColor.orange,
                                  ),
                                ),
                                const Text(" (124 đánh giá)"),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 15,
                                  child: Image.asset(
                                    Helper.getAssetName(
                                      "loc.png",
                                      "virtual",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("Số 150 Hoàng Hoa Thám, Hà Nội")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, pos) {
                            return const BurgerCard(
                              price: "17",
                              name: "Cheese Chicken Burger",
                            );
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColor.placeholder.withOpacity(0.25),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Thêm ghi chú",
                                style: Helper.getTheme(context).headline3,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.add,
                                      color: AppColor.orange,
                                    ),
                                    Text(
                                      "Thêm",
                                      style: TextStyle(
                                        color: AppColor.orange,
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Giá tiền",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$68",
                            style: Helper.getTheme(context).headline3?.copyWith(
                                  color: AppColor.orange,
                                ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Phí vận chuyển",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$2",
                            style: Helper.getTheme(context).headline3?.copyWith(
                                  color: AppColor.orange,
                                ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.placeholder.withOpacity(0.25),
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Tổng tiền",
                              style: Helper.getTheme(context).headline3,
                            ),
                          ),
                          Text(
                            "\$70",
                            style: Helper.getTheme(context).headline3?.copyWith(
                                  color: AppColor.orange,
                                  fontSize: 22,
                                ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Spacer(),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(CheckoutScreen.routeName);
                              },
                              child: Text("Đặt hàng"),
                            ),
                          ),
                          SizedBox(width: 25),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(CheckoutScreen.routeName);
                              },
                              child: Text("Xoá"),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 105),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  const BurgerCard({
    required String name,
    required String price,
    bool isLast = false,
  })  : _name = name,
        _price = price,
        _isLast = isLast;

  final String _name;
  final String _price;
  final bool _isLast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: _isLast
              ? BorderSide.none
              : BorderSide(
                  color: AppColor.placeholder.withOpacity(0.25),
                ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${_name} x1",
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "\$$_price",
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
