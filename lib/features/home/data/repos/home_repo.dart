import 'package:slash/core/network/api_error_handler.dart';
import 'package:slash/core/network/api_result.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';
import 'package:slash/features/home/data/models/product_response.dart';

import '../../../../core/network/api_service.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<ApiResult<List<Product>>> getProducts() async {
    try {
      final response = await apiService.getProducts();
      List<Product> data = response.data;
      return ApiResult.success(data);
    } catch (error) {
      print(error);
      print(error.toString());
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProductDetailsModel>> getProductDetails(
      int productId) async {
    try {
      final response = await apiService.getProductDetails(productId);
      final ProductDetailsModel data = response.data;
      return ApiResult.success(data);
    } catch (error) {
      print(error);
      print(error.toString());
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
