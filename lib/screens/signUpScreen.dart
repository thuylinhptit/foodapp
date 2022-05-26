import 'package:flutter/material.dart';
import 'package:food/data/data_login.dart';
import '../const/colors.dart';
import '../screens/loginScreen.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signUpScreen';
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
        body: ListView(
      children: [
        Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              // shrinkWrap: true,
              children: [
                Text(
                  "Đăng ký",
                  style: Helper.getTheme(context).headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Điền thông tin của bạn để đăng ký",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: "Tên",
                  controller: nameController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: "Email",
                  controller: emailController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: "Số điện thoại",
                  controller: phoneController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: "Địa chỉ",
                  controller: addressController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: "Mật khẩu",
                  controller: passController,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(await postSignUp(
                          nameController.text,
                          emailController.text,
                          phoneController.text,
                          addressController.text,
                          passController.text));
                    },
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
        )
      ],
    ));
  }
}
