import 'package:flutter_application_figma_3/data/models/product_model';

class ProductRemoteData {
  Future<List<ProductModel>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1)); 
    return [
      ProductModel(
        id: "1",
        name: "White Sneakers",
        price: 59.99,
        imageUrl:
            "https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7541.jpg",
      ),
      ProductModel(
        id: "2",
        name: "Blue Jeans",
        price: 39.99,
        imageUrl:
            "https://img.freepik.com/free-photo/folded-blue-jeans_1203-7566.jpg",
      ),
    ];
  }
}
