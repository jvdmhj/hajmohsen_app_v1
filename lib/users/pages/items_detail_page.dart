import 'package:flutter/material.dart';
import 'package:hajmohsen/models/product.dart';
import 'package:hajmohsen/styles/vertical_counter.dart';
import 'package:hajmohsen/styles/styles.dart';
import 'package:hajmohsen/users/providers/cart_providers.dart';
import 'package:hajmohsen/users/providers/favorite_providers.dart';
import 'package:provider/provider.dart';

class ItemsDetailPage extends StatefulWidget {
  final Product product;
  const ItemsDetailPage({super.key, required this.product});

  @override
  State<ItemsDetailPage> createState() => _ItemsDetailPageState();
}

class _ItemsDetailPageState extends State<ItemsDetailPage> {
  int rating = 0;
   int userRating = 0;
  int orderCount = 1;

  @override
  void initState() {
    super.initState();
    userRating = widget.product.userRating;
  }

  void rateProduct(int newRating) {
    setState(() {
      if (userRating == 0) {
        widget.product.totalRating += newRating;
        widget.product.ratingCount += 1;
      } else {
        widget.product.totalRating =
            widget.product.totalRating - userRating + newRating;
      }

      userRating = newRating;
      widget.product.userRating = newRating;
    });
  }

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
    final product = widget.product;
    final size = MediaQuery.of(context).size;
     final favorite = context.watch<FavoriteProviders>();
     final isSaved=favorite.isFavorite(product);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 255, 245, 230),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(product.category, style: title(context)),
              backgroundColor: Colors.transparent,
              snap: true,
              floating: true,
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product.imageAddress,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: size.width * 0.03,
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    product.title,
                                    style: title(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.0,
                                ),
                                child: Row(
                                  children: [
                                    buildInteractiveStars(
                                      widget.product.averageRating,
                                    ),
                                    SizedBox(height: size.width * 0.02),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: size.width * 0.01,
                                      ),
                                      child: Text(
                                        '${toPersianNumber(widget.product.ratingCount)} نظر',
                                        style: voteStyle(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.width * 0.02),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${toPersianNumber(widget.product.price)} هزار تومان ',
                                  style: itemsPrice(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalCounter(
                          initialValue: 1,
                          onChanged: (value) {
                            setState(() {
                              orderCount = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.04,
                      ),
                      child: Text(
                        '${product.description}.',
                        style: description(context),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            final cart = context.read<CartProvider>();
                            cart.addToCart(product, orderCount);
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(' به سبد خرید اضافه شد'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.08,
                              vertical: size.height * 0.01,
                            ),
                            child: Text(
                              'افزودن به سبد خرید',
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
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 240, 187),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            icon: Icon(
                              isSaved ? Icons.bookmark : Icons.bookmark_border,
                              color: isSaved ? Colors.black : Colors.grey,
                              size: 30,
                            ),
                            color: Colors.amber,
                            iconSize: 30,
                            onPressed: () {
                           context.read<FavoriteProviders>().toggleFavorite(product);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInteractiveStars(double avgRating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        double displayRating = userRating == 0
            ? avgRating
            : userRating.toDouble();

        IconData icon;
        if (index < displayRating.floor()) {
          icon = Icons.star;
        } else if (index < displayRating) {
          icon = Icons.star_half;
        } else {
          icon = Icons.star_border;
        }

        return IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: Icon(icon, color: Colors.amber, size: 28),
          onPressed: () => rateProduct(index + 1),
        );
      }),
    );
  }
}
