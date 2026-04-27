import 'package:get/get.dart';

class ApiProvider extends GetConnect {

  @override
  void onInit() {
    httpClient.baseUrl = "https://petstore.swagger.io/v2/";

   
    super.onInit();
  }

  Future<Response> getPets(String status) {
    return get("https://petstore.swagger.io/v2/pet/findByStatus?status=$status");
  }
}