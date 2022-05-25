import 'package:flutter/material.dart';

import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class ForgetPwScreen extends StatelessWidget {
  static const routeName = "/restpwScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Thay đổi mật khẩu",
                  style: Helper.getTheme(context).headline6,
                ),
                const Spacer(),
                const Text(
                  "Nhập email của bạn để xác nhận",
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                const CustomTextInput(hintText: "Email"),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Gửi"),
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
