
class CartModel {
  final String id;
  final String? productId;
  final String title;
  final int price;
  final int quantity;
  final String imgUrl;
  final String size;

  CartModel({
    required this.id,
     this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imgUrl,
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
