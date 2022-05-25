import 'package:flutter/material.dart';
import 'package:food/const/colors.dart';
import 'package:food/utils/helper.dart';

import 'homeScreen.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _controller;
  int count = 0;
  final List<Map<String?, String?>> _pages = [
    {
      "image": "vector1.png",
      "title": "Tìm món ăn bạn yêu thích",
      "desc":
          "Khám phá những món ăn ngon nhất từ hơn 1.000 nhà hàng và giao hàng tận nơi nhanh chóng"
    },
    {
      "image": "vector2.png",
      "title": "Giao hàng nhanh",
      "desc": "Giao đồ ăn nhanh tận nhà, văn phòng mọi lúc mọi nơi"
    },
    {
      "image": "vector3.png",
      "title": "Theo dõi trực tiếp",
      "desc":
          "Theo dõi thời gian thực món ăn của bạn trên ứng dụng sau khi bạn đặt hàng"
    },
  ];

  @override
  void initState() {
    _controller = new PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: 400,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        count = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(Helper.getAssetName(
                          _pages[index]["image"], "virtual"));
                    },
                    itemCount: _pages.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 0 ? AppColor.orange : AppColor.placeholder,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 1 ? AppColor.orange : AppColor.placeholder,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 2 ? AppColor.orange : AppColor.placeholder,
                    )
                  ],
                ),
                Spacer(),
                Text(
                  _pages[count]["title"]!,
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text(
                  _pages[count]["desc"]!,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.routeName);
                      },
                      child: const Text("Tiếp theo")),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
