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

  //add 
   Future<Response> addPet(Map<String, dynamic> data) {
    return post("https://petstore.swagger.io/v2/pet", data);
  }
  //put 
   Future<Response> updatePet(Map<String, dynamic> data) {
    return put("https://petstore.swagger.io/v2/pet", data);
  }
   //delete
  Future<Response> deletePet(int id) {
    return delete("https://petstore.swagger.io/v2/pet/$id");
  }
}