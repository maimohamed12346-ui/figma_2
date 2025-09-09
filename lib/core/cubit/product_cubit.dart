import 'package:flutter_application_figma_3/data/models/product_model';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState.initial());

  Future<void> loadProducts() async {
    try {
      final response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        final products = data.map((e) {
          return ProductModel(
            id: e["id"].toString(),
            name: e["title"],
            price: (e["price"] as num).toDouble(),
            imageUrl: e["image"],
          );
        }).toList();

        emit(state.copyWith(products: products));
      } else {
        emit(state.copyWith(products: []));
      }
    } catch (e) {
      emit(state.copyWith(products: []));
    }
  }
}
