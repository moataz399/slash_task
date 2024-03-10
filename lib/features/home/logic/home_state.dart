part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ProductsLoadingState extends HomeState {}

class ProductsSuccessState extends HomeState {
  final List<Product> list;

  ProductsSuccessState(this.list);
}

class ProductsFailureState extends HomeState {
  final String error;

  ProductsFailureState({required this.error});
}

class ProductDetailsLoading extends HomeState {}

class ProductDetailsSuccessState extends HomeState {
  final ProductDetailsModel productDetailsModel;

  ProductDetailsSuccessState({required this.productDetailsModel});
}

class ProductDetailsFailureState extends HomeState {
  final String error;

  ProductDetailsFailureState({required this.error});
}
