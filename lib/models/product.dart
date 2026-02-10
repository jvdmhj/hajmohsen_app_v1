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
}
