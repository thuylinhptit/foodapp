import 'package:flutter/material.dart';
import 'package:food/data/data_login.dart';
import 'package:food/screens/myOrderScreen.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profileScreen";
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController passController = TextEditingController();
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
                  child: ListView(
                    shrinkWrap: true,
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
                      Column(
                        children: [
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Helper.getAssetName(
                                    "edit_filled.png", "virtual"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Chỉnh sửa thông tin",
                                style: TextStyle(color: AppColor.orange),
                              ),
                            ],
                          ),
                          const SizedBox(
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
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.only(left: 40),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColor.placeholderBg,
                        ),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Tên",
                            contentPadding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            hintText: dataUser[1].toString(),
                            hintStyle: const TextStyle(
                              color: AppColor.placeholder,
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Email",
                        value: dataUser[3].toString(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormImput(
                        label: "Mobile No",
                        value: dataUser[4].toString(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.only(left: 40),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColor.placeholderBg,
                        ),
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Địa chỉ",
                              contentPadding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              hintText: dataUser[5].toString()),
                          obscureText: false,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.only(left: 40),
                        decoration: const ShapeDecoration(
                          shape: StadiumBorder(),
                          color: AppColor.placeholderBg,
                        ),
                        child: TextField(
                          controller: passController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Mật khẩu",
                              contentPadding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              hintText: dataUser[2].toString()),
                          obscureText: false,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            print(dataUser[3]);
                            postEditUser(
                                dataUser[3],
                                dataUser[4],
                                nameController.text,
                                addressController.text,
                                passController.text);
                          },
                          child: Text("Lưu"),
                        ),
                      ),
                      SizedBox(
                        height: 130,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
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
