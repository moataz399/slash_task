import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slash/features/home/data/models/product.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("https://slash-backend.onrender.com/product/?limit=6&page=2")
  Future<ProductResponse> getProducts();
}
