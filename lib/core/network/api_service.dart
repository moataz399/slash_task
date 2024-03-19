import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slash/features/home/data/models/product_details_response.dart';
import 'package:slash/features/home/data/models/product_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://slash-backend.onrender.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("product/?limit=40&page=1")
  Future<ProductResponse> getProducts();

  @GET("product/{productId}")
  Future<ProductDetailsResponse> getProductDetails(@Path("productId") int productId);
}
