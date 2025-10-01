class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  ProductModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      category: jsonData['category'],
      description: jsonData['description'],
      id: jsonData['id'],
      image: jsonData["image"],
      price: jsonData['price'],
      title: jsonData['title'],
    );
  }
}
