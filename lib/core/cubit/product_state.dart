import 'package:flutter_application_figma_3/data/models/product_model';


class ProductState {
  final List<ProductModel> products;

  ProductState({required this.products});

  factory ProductState.initial() => ProductState(products: []);

  ProductState copyWith({List<ProductModel>? products}) {
    return ProductState(products: products ?? this.products);
  }
}
