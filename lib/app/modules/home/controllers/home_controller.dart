import 'package:get/get.dart';
import 'package:pets_store/app/data/models/pet_model.dart';
import 'package:pets_store/app/data/providers/api_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
 final ApiProvider api = ApiProvider();

  var pets = <PetModel>[].obs;
  var isLoading = false.obs;
//
   var selectedStatus = "available".obs;

  @override
  void onInit() {
    fetchPets();
    super.onInit();
  }

  void fetchPets() async {
    try {
      isLoading(true);

      final response = await api.getPets(selectedStatus.value);

      if (response.statusCode == 200) {
        List data = response.body;

        pets.value =
            data.map((e) => PetModel.fromJson(e)).toList();
      }else{
        Get.snackbar("Error", "Failed to load data");
      }

    } finally {
      isLoading(false);
    }
  }
////////
 void changeStatus(String status) {
    selectedStatus.value = status;
    fetchPets();
  }

   //  ADD PET
  void addPet(String name) async {
    try {
      isLoading(true);

      final data = {
        "id": DateTime.now().millisecondsSinceEpoch,
        "name": name,
        "status": "available"
      };

      final response = await api.addPet(data);

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Pet Added");
      } else {
        Get.snackbar("Error", "Failed to add");
      }
    } finally {
      isLoading(false);
    }
  }
   
   // DELETE PET
  void deletePet(int id) async {
    try {
      isLoading(true);

      final response = await api.deletePet(id);

      if (response.statusCode == 200) {
        Get.snackbar("Deleted", "Pet Removed");
      } else {
        Get.snackbar("Error", "Failed to delete");
      }
    } finally {
      isLoading(false);
    }
  }

}