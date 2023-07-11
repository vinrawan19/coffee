class ProductModel {
  int id;
  String name;
  String type;
  double price;
  String details;
  String asset;
  List productCustomization;

  ProductModel({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.details,
    String? asset,
    required this.productCustomization,
  }) : asset = asset ?? "assets/dummy/no-photo-available.png";
}
