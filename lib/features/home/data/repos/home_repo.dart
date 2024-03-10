import 'package:slash/core/network/api_error_handler.dart';
import 'package:slash/core/network/api_result.dart';
import 'package:slash/features/home/data/models/product.dart';

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
}
