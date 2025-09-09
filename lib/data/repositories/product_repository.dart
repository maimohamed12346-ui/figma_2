
import 'package:flutter_application_figma_3/data/datasources/product_remote_data_source.dart';
import 'package:flutter_application_figma_3/data/models/product_model';



class ProductRepository {
  final ProductRemoteData remoteData;

  ProductRepository(this.remoteData);

  Future<List<ProductModel>> getProducts() async {
    return await remoteData.fetchProducts();
  }
}
