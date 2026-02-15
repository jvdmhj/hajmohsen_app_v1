import 'package:hajmohsen/models/product.dart';

class FavoriteItems {
  final Product product;

  FavoriteItems({required this.product});

  Map<String , dynamic> json() {
      return{
        'product':product.toJson()
      };
  }
  factory FavoriteItems.fromJson(Map<String,dynamic>json) {
    return FavoriteItems(product: Product.fromJson(json['product']));
  }
}


