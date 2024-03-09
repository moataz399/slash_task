part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class ProductsLoadingState  extends HomeState {}
class ProductsSuccessState  extends HomeState {

 final  List<Product> list;

 ProductsSuccessState( this.list);
}
class ProductsFailureState extends HomeState {

  final String error;
  ProductsFailureState({required this.error});
}
