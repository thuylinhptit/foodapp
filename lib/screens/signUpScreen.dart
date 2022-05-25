import 'package:flutter/material.dart';
import '../const/colors.dart';
import '../screens/loginScreen.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              Text(
                "Đăng ký",
                style: Helper.getTheme(context).headline6,
              ),
              const Spacer(),
              const Text(
                "Điền thông tin của bạn để đăng ký",
              ),
              const Spacer(),
              const CustomTextInput(hintText: "Tên"),
              const Spacer(),
              const CustomTextInput(hintText: "Email"),
              const Spacer(),
              const CustomTextInput(hintText: "Số điện thoại"),
              const Spacer(),
              const CustomTextInput(hintText: "Địa chỉ"),
              const Spacer(),
              const CustomTextInput(hintText: "Mật khẩu"),
              const Spacer(),
              const CustomTextInput(hintText: "Nhập lại mật khẩu"),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Đăng ký"),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Bạn đã có tài khoản?"),
                    Text(
                      "Đăng nhập",
                      style: TextStyle(
                        color: AppColor.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
