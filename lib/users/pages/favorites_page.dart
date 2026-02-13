import 'package:flutter/material.dart';
import 'package:hajmohsen/users/pages/items_detail_page.dart';
import 'package:hajmohsen/users/providers/favorite_providers.dart';
import 'package:provider/provider.dart';
import 'package:hajmohsen/styles/styles.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

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
    final favorite = context.watch<FavoriteProviders>().favorite;
    final size = MediaQuery.of(context).size;
    final fave = context.watch<FavoriteProviders>();

    return Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 245, 230),
      appBar: AppBar(
             backgroundColor: const Color.fromARGB(255, 255, 245, 230),
        elevation: 0,
        title: Text(
          'علاقه مندی ها',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontFamily: 'BNazanin',
          ),
        ),
        actions: [
              if (fave.favorite.isNotEmpty)
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
                              fave.clearAll();
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
      ),
      body: favorite.isEmpty
          ? Center(child: Text('موردی ذخیره نشده', style: h1(context)))
          : ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
                horizontal: size.width * 0.03,
              ),
              itemCount: favorite.length,
              itemBuilder: (context, index) {
                final product = favorite[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,MaterialPageRoute(builder: (_)=>ItemsDetailPage(product: product)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: size.height * 0.02),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            product.imageAddress,
                             width: 140,
                                height: 170,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(product.title, style: description(context)),
                              Text(
                                '${toPersianNumber(product.price)} هزار تومان',
                                style: regularpersian(context),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.1),
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              fave.removeFavoritesItems(index);
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
