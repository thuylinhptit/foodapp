import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food/data/data_login.dart';
import 'package:food/screens/introScreen.dart';
import '../const/colors.dart';
import '../screens/forgetPwScreen.dart';
import '../screens/signUpScreen.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";

  @override
  Widget build(BuildContext context) {
    TextEditingController editingControllerEmail = TextEditingController();
    TextEditingController editingControllerPass = TextEditingController();
    return Scaffold(
      body: SizedBox(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Đăng nhập",
                  style: Helper.getTheme(context).headline6,
                ),
                const Spacer(),
                const Text('Điền thông tin của bạn để đăng nhập'),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const ShapeDecoration(
                    color: AppColor.placeholderBg,
                    shape: StadiumBorder(),
                  ),
                  child: TextField(
                    autofocus: true,
                    controller: editingControllerEmail,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nhập email:",
                      hintStyle: TextStyle(
                        color: AppColor.placeholder,
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                    // onChanged: (value) {
                    //   editingControllerEmail.text = value;
                    // },
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const ShapeDecoration(
                    color: AppColor.placeholderBg,
                    shape: StadiumBorder(),
                  ),
                  child: TextField(
                    autofocus: true,
                    controller: editingControllerPass,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nhập mật khẩu:",
                      hintStyle: TextStyle(
                        color: AppColor.placeholder,
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                    // onChanged: (value) {
                    //   editingControllerPass.text = value;
                    // },
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      var response = await postLogin(
                          editingControllerEmail.text,
                          editingControllerPass.text);
                      if (response) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IntroScreen()),
                        );
                      } else {
                        print("FALSE");
                      }
                      //text
                    },
                    child: Text("Đăng nhập"),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context)
                    //     .pushReplacementNamed(ForgetPwScreen.routeName);
                  },
                  child: Text("Quên mật khẩu ?"),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Spacer(
                  flex: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Bạn chưa có tài khoản?"),
                      Text(
                        "Đăng ký",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
