import 'package:flutter/material.dart';
import 'package:hajmohsen/styles/styles.dart';
import 'package:hajmohsen/users/pages/main_page.dart';
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
      extendBody: false,
      backgroundColor: const Color.fromARGB(255, 255, 245, 230),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('سبد خرید', style: h1(context)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: [
              if (cart.items.isNotEmpty)
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'حذف همه ی آیتم ها',
                          style: showDialogStyle(context),
                        ),
                        content: Text(
                          'آیا مطمئن هستید که می‌خواهید همه آیتم‌ها حذف شوند؟',
                          style: alertDialogStyle(context),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'لغو',
                              style: alertDialogStyleCancel(context),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              cart.clearAll();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'حذف',
                              style: alertDialogStyleRemove(context),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.delete_sweep),
                ),
            ],
            snap: true,
            floating: true,
            elevation: 0,
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (cart.items.isEmpty) {
                return SizedBox(
                  height: size.height * 0.8,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => MainPage()),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/add-to-cart.png',
                              width: size.width * 0.2,
                              height: size.height * 0.2,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.03,
                        ),
                        child: Text('سبد خرید خالی است', style: h1(context)),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'هیچ آیتمی جهت ثبت آن وجود ندارد.',
                                  style: showDialogStyle(context),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'لغو',
                                      style: alertDialogStyleCancel(context),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => MainPage(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'افزودن آیتم',
                                          style: alertDialogStyleAdd(context),
                                        ),
                                        Icon(Icons.add, color: Colors.blue),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.2,
                          ),
                          child: Text(
                            ' ثبت سفارش',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'BNazanin',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

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
                      Expanded(
                        child: Column(
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.15),
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            cart.removeItems(index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: cart.items.isEmpty ? 1 : cart.items.length),
          ),
          if (cart.items.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                  horizontal: size.width * 0.03,
                ),
                child: Card(
                  elevation: 0,
                  color: Colors.amberAccent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.04,
                    ),
                    child: Text(
                      'مجموع کل : ${toPersianNumber(cart.totalPrice)} هزار تومان',
                      style: regularpersian(context),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),

      bottomNavigationBar: cart.items.isEmpty
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.035,
                horizontal: size.width * 0.04,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 245, 230),
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: Colors.black12),
                    ],
                  ),
                  child: SafeArea(
                    child: SizedBox(
                      height: size.height * 0.06,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) =>
                                Center(child: CircularProgressIndicator()),
                          );
                          await Future.delayed(Duration(seconds: 3));

                          if (!context.mounted) return;

                          Navigator.pop(context);

                          cart.clearAll();

                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                'سفارش با موفقیت ثبت شد',
                                style: alertDialogStyle(context),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'باشه',
                                    style: alertDialogStyleCancel(context),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          ' ثبت سفارش',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'BNazanin',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
