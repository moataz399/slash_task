import 'package:slash/core/helpers/dio_helper.dart';
import 'package:slash/features/home/data/models/product_model.dart';


 class ApiService2 {
  Future<List<ProductModelResponse>> getProducts() async {
    try {
      var response = await DioHelper.getData(
          url: "https://slash-backend.onrender.com/product/?limit=6&page=1");
      return response.data;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
