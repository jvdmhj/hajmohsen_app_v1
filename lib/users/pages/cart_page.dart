import 'package:flutter/material.dart';
import 'package:hajmohsen/styles/styles.dart';
import 'package:hajmohsen/users/providers/cart_providers.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String toPersianNumber(num input) {
    final english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    final persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String result = input.toString();
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], persian[i]);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('سبد خرید', style: title(context)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 245, 230),
      body: cart.items.isEmpty
          ? Center(child: Text('سبد خرید خالی است'))
          : ListView.separated(
              itemCount: cart.items.length,
              separatorBuilder: (_, __) => SizedBox(height: size.height * 0.01),
              itemBuilder: (context, index) {
                final item = cart.items[index];
                final totalPrice = item.product.price * item.quantity;
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                    vertical: size.height * 0.02,
                  ),
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.02),
                          child: ClipRRect(
                            child: Image.asset(
                              item.product.imageAddress,
                              width: 140,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.product.name, style: title(context)),
                            Text(
                              'تعداد : ${toPersianNumber(item.quantity)} عدد',
                              style: regular(context),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.04,
                                bottom: size.height * 0.015,
                              ),
                              child: Text(
                                'قیمت واحد : ${toPersianNumber(item.product.price)} هزار تومان',
                                style: regularpersian(context),
                              ),
                            ),
                            Text(
                              'قیمت کل : ${toPersianNumber(totalPrice)} هزار تومان',
                              style: regularpersian(context),
                            ),

                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.15),
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('حذف آیتم'),
                                  content: Text(
                                    'آیتم ${item.product.name} از لیست خرید حذف شود؟',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('لغو'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        cart.removeItems(index);
                                        Navigator.pop(context);
                                      },
                                      child: Text('حذف'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
