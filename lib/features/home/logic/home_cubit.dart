import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slash/features/home/data/models/product_model.dart';
import 'package:slash/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  List<ProductModelResponse> productsList = [];

  getProducts() async {
    emit(ProductsLoadingState());

    final response = await homeRepo.getProducts();

    response.when(success: (productModelResponse) {
      productsList.addAll(productModelResponse);
      emit(ProductsSuccessState());
    }, failure: (error) {
      print(error.apiErrorModel.message.toString());
      emit(ProductsFailureState(
          error: error.apiErrorModel.message ?? "WTF IS THIS SHIT "));
    });
  }
}
