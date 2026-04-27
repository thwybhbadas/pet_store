import 'package:get/get.dart';
import 'package:pets_store/app/data/models/pet_model.dart';

class DetailsController extends GetxController {
  //TODO: Implement DetailsController

  late PetModel pet;
  @override
  void onInit() {
     pet = Get.arguments;
    super.onInit();
  }
}
 
 
