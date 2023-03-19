// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchProductsHash() => r'12b132add90bd88536d115b15d8127af7da4b296';

/// See also [fetchProducts].
@ProviderFor(fetchProducts)
final fetchProductsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  fetchProducts,
  name: r'fetchProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$productsHash() => r'7745dc43ffac0be7b6d7b2262d56be193265d0f6';

/// See also [Products].
@ProviderFor(Products)
final productsProvider =
    AutoDisposeAsyncNotifierProvider<Products, List<Product>>.internal(
  Products.new,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Products = AutoDisposeAsyncNotifier<List<Product>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
