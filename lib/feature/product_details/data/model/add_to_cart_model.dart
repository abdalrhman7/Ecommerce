import 'package:e_commerce/feature/cart/data/model/cart_model.dart';

class AddToCartModel extends CartModel {
  AddToCartModel({
    required super.id,
    required super.productId,
    required super.title,
    required super.price,
    super.quantity = 1,
    required super.imgUrl,
    required super.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': productId,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'quantity': quantity,
      'size': size,
    };
  }
}
