import 'package:flutter_application_figma_3/data/models/product_model';



class CartState {
  final List<ProductModel> items;

  CartState({required this.items});

  factory CartState.initial() => CartState(items: []);

  CartState copyWith({List<ProductModel>? items}) {
    return CartState(items: items ?? this.items);
  }

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + item.price);
}
