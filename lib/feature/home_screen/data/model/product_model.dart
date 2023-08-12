import '../../../../core/constants/app_assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final bool? isNew;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    this.category = 'Other',
    required this.isNew,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'category': category,
      'isNew': isNew,
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
      isNew: map['isNew'] as bool,
    );
  }
}



// List<Product> dummyProducts = [
//   Product(
//     id: '1',
//     title: 'T-shirt',
//     price: 150,
//     imgUrl: AppAssets.tempProductAsset1,
//     category: 'Clothes',
//     discountValue: 20,
//   ),
//   Product(
//     id: '1',
//     title: 'T-shirt',
//     price: 300,
//     imgUrl: AppAssets.tempProductAsset1,
//     category: 'Clothes',
//     discountValue: 20,
//   ),
//   Product(
//     id: '1',
//     title: 'T-shirt',
//     price: 300,
//     imgUrl: AppAssets.tempProductAsset1,
//     category: 'Clothes',
//     discountValue: 20,
//   ),
//   Product(
//     id: '1',
//     title: 'T-shirt',
//     price: 300,
//     imgUrl: AppAssets.tempProductAsset1,
//     category: 'Clothes',
//     discountValue: 20,
//   ),
//   Product(
//     id: '1',
//     title: 'T-shirt',
//     price: 300,
//     imgUrl: AppAssets.tempProductAsset1,
//     category: 'Clothes',
//     discountValue: 20,
//   ),
//   Product(
//     id: '1',
//     title: 'T-shirt',
//     price: 300,
//     imgUrl: AppAssets.tempProductAsset1,
//     category: 'Clothes',
//     discountValue: 20,
//   ),
// ];