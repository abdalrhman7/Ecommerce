import '../../../cart/data/model/cart_model.dart';

class Product extends ProductModel {
  final int? discountValue;
  final String category;

  Product({
    required super.id,
    required super.title,
    required super.price,
    required super.imgUrl,
    this.discountValue,
    this.category = 'Other',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'category': category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      discountValue: map['discountValue'] as int,
      category: map['category'] as String,
    );
  }
}
