import 'package:slash/core/network/api_error_handler.dart';
import 'package:slash/core/network/api_result.dart';
import 'package:slash/core/network/api_service2.dart';
import 'package:slash/features/home/data/models/product_model.dart';

import '../../../../core/network/api_service.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<ApiResult<List<ProductModelResponse>>> getProducts() async {
    try {
      final response = await apiService.getProducts();

      // var data = response
      //     .map((e) =>
      //         ProductModelResponse.fromJson(response as Map<String, dynamic>))
      //     .toList();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
