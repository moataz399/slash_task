
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slash/features/home/data/models/product.dart';
import 'package:slash/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  List<Product> productsList = [];

  Future getProducts() async {
    emit(ProductsLoadingState());

    final response = await homeRepo.getProducts();

    response.when(success: (productList) {
      productsList.addAll(productList);
      emit(ProductsSuccessState(productList));
    }, failure: (error) {
      print(error.apiErrorModel.message.toString());
      emit(ProductsFailureState(
          error: error.apiErrorModel.message ?? "WTF IS THIS SHIT "));
    });
  }
}
