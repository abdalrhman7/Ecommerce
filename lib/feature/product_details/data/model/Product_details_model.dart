import 'package:e_commerce/feature/cart/data/model/cart_model.dart';

class AddToCartModel extends ProductModel {
  final int quantity;
  final String? size;

  AddToCartModel({
    required super.id,
    required super.title,
    required super.price,
    required super.imgUrl,
    this.quantity = 1,
    this.size,
  });


  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'quantity': quantity,
      'size': size,
    };
  }
}

class FavoriteModel extends ProductModel {
  bool isFavorite;
  FavoriteModel({
    required super.id,
    required super.title,
    required super.price,
    required super.imgUrl,
    required this.isFavorite
  });


  @override
  factory FavoriteModel.fromMap(Map<String, dynamic> map, String documentId) {
    return FavoriteModel(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'isFavorite': isFavorite,
    };
  }

}
