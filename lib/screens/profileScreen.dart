import 'package:flutter/material.dart';
import 'package:food/screens/myOrderScreen.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profileScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Thông tin người dùng",
                            style: Helper.getTheme(context).headline5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(MyOrderScreen.routeName);
                            },
                            child: Image.asset(
                              Helper.getAssetName("cart.png", "virtual"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ClipOval(
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                Helper.getAssetName(
                                  "user.jpg",
                                  "real",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 80,
                                color: Colors.black.withOpacity(0.3),
                                child: Image.asset(Helper.getAssetName(
                                    "camera.png", "virtual")),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Helper.getAssetName("edit_filled.png", "virtual"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Chỉnh sửa thông tin",
                            style: TextStyle(color: AppColor.orange),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hi!",
                        style: Helper.getTheme(context).headline4?.copyWith(
                              color: AppColor.primary,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Đăng xuất"),
                      const SizedBox(
                        height: 40,
                      ),
                      const CustomFormImput(
                        label: "Tên",
                        value: "Emilia Clarke",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomFormImput(
                        label: "Email",
                        value: "emiliaclarke@email.com",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Mobile No",
                        value: "emiliaclarke@email.com",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Địa chỉ",
                        value: "No 23, 6th Lane, Colombo 03",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Mật khẩu",
                        value: "Emilia Clarke",
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Xác nhận mật khẩu",
                        value: "Emilia Clarke",
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Lưu"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              profile: true,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFormImput extends StatelessWidget {
  const CustomFormImput({
    required String label,
    required String value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword;

  final String _label;
  final String _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: _label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        obscureText: _isPassword,
        initialValue: _value,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
