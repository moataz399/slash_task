import 'package:slash/core/helpers/dio_helper.dart';
import 'package:slash/features/home/data/models/product.dart';


 class ApiService2 {
  Future<List<ProductResponse>> getProducts() async {
    try {
      var response = await DioHelper.getData(
          url: "https://slash-backend.onrender.com/product/?limit=1&page=1");
      return response.data;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
