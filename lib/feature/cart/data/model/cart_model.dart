abstract class ProductModel {
  String id;
  String title;
  int price;
  String imgUrl;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
  });
}

class CartModel extends ProductModel {
  final int quantity;
  final String size;

  CartModel({
    required super.id,
    required super.title,
    required super.price,
    required super.imgUrl,
    required this.quantity,
    required this.size,
  });

  factory CartModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CartModel(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      size: map['size'] as String,
      quantity: map['quantity'] as int,
    );
  }
}
