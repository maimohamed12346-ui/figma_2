import 'package:flutter_application_figma_3/data/models/product_model';
import "package:flutter_bloc/flutter_bloc.dart";
import 'cart_state.dart';


class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addToCart(ProductModel product) {
    final updated = List<ProductModel>.from(state.items)..add(product);
    emit(state.copyWith(items: updated));
  }

  void removeFromCart(ProductModel product) {
    final updated = List<ProductModel>.from(state.items)..remove(product);
    emit(state.copyWith(items: updated));
  }

 
  void clearCart() {
    emit(state.copyWith(items: []));
  }

  void increaseQuantity(ProductModel product) {
    final index = state.items.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      final updated = [...state.items];
      updated[index] = updated[index].copyWith(
        quantity: (updated[index].quantity) + 1,
      );
      emit(CartState(items: updated));
    }
  }

  void decreaseQuantity(ProductModel product) {
    final index = state.items.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      final updated = [...state.items];
      final currentQty = updated[index].quantity;
      if (currentQty > 1) {
        updated[index] = updated[index].copyWith(
          quantity: currentQty - 1,
        );
        emit(CartState(items: updated));
      } else {
        removeFromCart(product); 
      }
    }
  }
}
