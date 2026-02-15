class Product {
  final String name;
  final String title;
  final String category;
  final int price;
  final String imageAddress;
  final String description;
    int totalRating;
    int ratingCount;
    int userRating;

  Product({
    required this.name,
    required this.title,
    required this.category,
    required this.price,
    required this.imageAddress,
    required this.description,
    this.totalRating = 0,
    this.ratingCount = 0,
    this.userRating = 0,
  });

  double get averageRating =>
      ratingCount == 0 ? 0 : totalRating / ratingCount;

      Map<String,dynamic>toJson() {
          return {
        'name' :name,
        'title' :title,
        'category':category,
        'price' :price,
        'imageAddress' :imageAddress,
        'description' :description,
        'totalRating' :totalRating,
        'ratingCount' :ratingCount,
        'userRating' :userRating,
          };
      }

      factory Product.fromJson(Map<String , dynamic>json){
        return Product(
          name: json['name'],
        title: json['title'],
        category: json['category'],
        price: json['price'],
        imageAddress:json['imageAddress'],
         description: json['description']);
      }
}
