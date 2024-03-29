import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';
import 'package:slash/features/home/data/models/product_response.dart';
import 'package:slash/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  List<Product> productsList = [];
  late ProductDetailsModel productDetailsModel;

  Future getProducts() async {
    emit(ProductsLoadingState());

    final response = await homeRepo.getProducts();

    response.when(success: (productList) {
      productsList.addAll(productList);
      emit(ProductsSuccessState(productList));
    }, failure: (error) {
      emit(ProductsFailureState(error: error.apiErrorModel.message!));
    });
  }

  Future getProductDetails(int productId) async {
    emit(ProductDetailsLoading());

    final response = await homeRepo.getProductDetails(productId);

    response.when(success: (productDetails) {
      productDetailsModel = productDetails;
      emit(ProductDetailsSuccessState(productDetailsModel: productDetails));
    }, failure: (error) {
      emit(ProductsFailureState(error: error.apiErrorModel.message!));
    });
  }

}
