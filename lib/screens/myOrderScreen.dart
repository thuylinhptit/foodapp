import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food/data/data_login.dart';
import 'package:food/model/bill.dart';
import 'package:food/model/cart.dart';
import 'package:food/model/food.dart';
import 'package:food/screens/individualItem.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';
import 'checkoutScreen.dart';

List<Food> listCart = [];

class MyOrderScreen extends StatefulWidget {
  static const routeName = "/myOrderScreen";
  @override
  _MyOrderScreen createState() => _MyOrderScreen();
}

class _MyOrderScreen extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    int count = 0;
    int totalPrice = 0;
    TextEditingController controller = TextEditingController();
    for (int i = 0; i < listCart.length; i++) {
      totalPrice += (listCart[i].price.toInt()) * (listCart[i].slg);
    }
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              shrinkWrap: true,
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
                Container(
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listCart.length,
                          itemBuilder: (context, pos) {
                            return Slidable(
                              startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      print("DElete");
                                      setState(() {
                                        listCart.removeAt(pos);
                                      });
                                    },
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    BurgerCard(
                                      price: listCart[pos].price.toInt(),
                                      name: listCart[pos].ten,
                                      image: listCart[pos].image,
                                      count: listCart[pos].slg,
                                    )
                                  ],
                                ),
                              ),
                            );
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    shrinkWrap: true,
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
                      const SizedBox(
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
                            totalPrice.toString(),
                            style: Helper.getTheme(context).headline3?.copyWith(
                                  color: AppColor.orange,
                                ),
                          )
                        ],
                      ),
                      const SizedBox(
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
                            "2000",
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
                      const SizedBox(
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
                            (totalPrice + 2000).toString(),
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
                                for (int i = 0; i < listCart.length; i++) {
                                  print(listCart[i].price);
                                  // totalPrice += (listCart[i].price as int) * (listCart[i].slg);
                                  print("");
                                }
                                List<CartItem> lci = [];
                                for (int i = 0; i < listCart.length; i++) {
                                  lci.add(CartItem(
                                      listCart[i].id, listCart[i].slg));
                                  print(listCart[i].id);
                                }
                                List<Bill> listBill = [];
                                for (int i = 0; i < listCart.length; i++) {
                                  listBill.add(Bill(listCart[i].ten,
                                      listCart[i].slg, listCart[i].price));
                                  print(listCart[i].id);
                                }
                                postCreateBill(dataUser[3],
                                    dataUser[4].toString(), listBill);
                                print(listBill);
                                postEditCart(
                                    dataUser[3], dataUser[4].toString(), lci);
                                print("||BILL||");
                                print(dataBill[dataBill.length - 1]['deatil']);
                              },
                              child: const Text("Đặt hàng"),
                            ),
                          ),
                          const SizedBox(width: 25),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .pushNamed(CheckoutScreen.routeName);
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
          const Positioned(
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
    required int price,
    required String image,
    bool isLast = false,
    required this.count,
  })  : _name = name,
        _price = price,
        _isLast = isLast,
        _image = image;

  final String _name;
  final int _price;
  final bool _isLast;
  final String _image;
  final int count;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
            height: 140,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          Helper.getAssetName("${_image}", "real"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${_name}",
                      style: Helper.getTheme(context).headline3,
                    ),
                    Spacer(),
                    Text(
                      "${_price}",
                      style: Helper.getTheme(context).headline3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "So luong: ",
                      style: Helper.getTheme(context).headline3,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(child: Consumer<MyModel>(
                      builder: (context, myModel, child) {
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(5.0)),
                              onPressed: () {
                                myModel.decre();
                              },
                              child: const Text("-"),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 35,
                              width: 55,
                              decoration: const ShapeDecoration(
                                shape: StadiumBorder(
                                  side: BorderSide(color: AppColor.orange),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(
                                      color: AppColor.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(5.0)),
                              onPressed: () {
                                myModel.increase();
                              },
                              child: const Text("+"),
                            ),
                          ],
                        );
                      },
                    )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            )),
      ),
    );
  }
}
