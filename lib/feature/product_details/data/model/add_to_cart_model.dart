import 'package:e_commerce/feature/cart/data/model/cart_model.dart';

class AddToCartModel extends ProductModel {
  final int quantity;
  final String size;

  AddToCartModel({
    required super.id,
    required super.title,
    required super.price,
    required super.imgUrl,
    this.quantity = 1,
    required this.size,
  });

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
// class AddToCartModel extends CartModel {
//   AddToCartModel({
//     required super.id,
//     required super.productId,
//     required super.title,
//     required super.price,
//     super.quantity = 1,
//     required super.imgUrl,
//     required super.size,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': productId,
//       'title': title,
//       'price': price,
//       'imgUrl': imgUrl,
//       'quantity': quantity,
//       'size': size,
//     };
//   }
// }