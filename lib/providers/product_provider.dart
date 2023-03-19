import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:superwizor/models/product_model.dart';
import 'package:superwizor/services/api_services.dart';

part 'product_provider.g.dart';

@riverpod
class Products extends _$Products {
  @override
  Future<List<Product>> build() async {
    final data = await ref.watch(apiServicesProvider).getProducts();
    final products = data.products;
    return products;
    
  }
}

@riverpod
Future<List<Product>> fetchProducts(
  FetchProductsRef ref,
) async {
  final data = await ref.watch(apiServicesProvider).getProducts();

  final products = data.products;

  return products;
}
