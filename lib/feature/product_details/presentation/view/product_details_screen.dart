import 'package:e_commerce/core/constants/app_value.dart';
import 'package:e_commerce/core/constants/text_style.dart';
import 'package:e_commerce/feature/home_screen/data/model/product_model.dart';
import 'package:e_commerce/feature/product_details/business_logic/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/document_id.dart';
import '../../../../core/widget/drop_down_menu.dart';
import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/main_dialog.dart';
import '../../../../core/widget/main_snack_bar.dart';
import '../../data/model/add_to_cart_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> itemsSize = ['S', 'M', 'L', 'XL', 'XXL'];

  String description =
      'This is a dummy description for this product! i think we weill add it in the future! i need to add more lines , so i add these words just to have more then to line';
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('product name'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppPadding.p12),
            child: const Icon(Icons.share),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: .42.sh,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                widget.product.imgUrl,
              ),
            )),
          ),
          SizedBox(height: AppSize.s16Height),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: AppSize.s50Height,
                      width: AppSize.s125Width,
                      child: DropDownMenuComponent(
                        hint: 'Size',
                        items: itemsSize,
                        onChanged: (value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: AppSize.s45Height,
                      width: AppSize.s45Width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white70,
                          border: Border.all(color: Colors.black45)),
                      child: const Icon(Icons.favorite_border),
                    )
                  ],
                ),
              ),
              SizedBox(height: AppSize.s20Height),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.title,
                            style: Style.textStyle22
                                .copyWith(fontWeight: FontWeight.bold)),
                        Text('\$${widget.product.price}',
                            style: Style.textStyle22
                                .copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: AppSize.s10Height),
                    Text(widget.product.category,
                        style: Style.textStyle14
                            .copyWith(color: Colors.grey.shade600)),
                    SizedBox(height: AppSize.s10Height),
                    Text(description,
                        style: Style.textStyle14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                        )),
                    SizedBox(height: AppSize.s30Height),
                    MainButton(
                      onTap: () {
                        if (dropdownValue != null) {
                          _addToCart();
                          mainSnackBar(context ,'Item Added');
                        } else {
                           MainDialog(
                            context: context,
                            title: 'error',
                            content: 'Please chose size first',
                          ).showAlertDialog();
                        }
                      },
                      text: 'Add To Cart',
                      hasCircularBorder: true,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> _addToCart() async {
    final addToCartProduct = AddToCartModel(
      id: documentIdFromLocalData(),
      title: widget.product.title,
      price: widget.product.price,
      productId: widget.product.id,
      imgUrl: widget.product.imgUrl,
      size: dropdownValue!,
    );

    BlocProvider.of<AddToCartCubit>(context).addToCart(addToCartProduct);
  }
}
