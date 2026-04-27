import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:pets_store/app/modules/home/widgets/pet_card_widget.dart';
import 'package:pets_store/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  /////////
  final List<String> statuses = ["available", "pending", "sold"];
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(Routes.CRUD);
      }),
      appBar: AppBar(title: Text("Pets")),

      body: Column(
        children: [
          //  Filter Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: statuses.map((status) {
              return ElevatedButton(
                onPressed: () {
                  controller.changeStatus(status);
                },
                child: Text(status),
              );
            }).toList(),
          ),

          //  Data
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (controller.pets.isEmpty) {
                return Center(child: Text("No Pets Found"));
              }
              return ListView.builder(
                itemCount: controller.pets.length,
                itemBuilder: (context, index) {
                  var pet = controller.pets[index];

                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 400),
                    opacity: 1,
                    child: Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          child: Text((pet.name.isNotEmpty) ? pet.name[0].toUpperCase() : "?"),
        ),
        title: Text(pet.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(pet.status),
         // 🗑️ Delete
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [


                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        controller.deletePet(pet.id);
                      },
                    ),
                  ],
                ),
      ),
    ),
                  );
                  // return TweenAnimationBuilder(
                  //   duration: Duration(milliseconds: 600),
                  //   tween: Tween(begin: 40.0, end: 0.0),
                  //   builder: (context, value, child) {
                  //     return Transform.translate(
                  //       offset: Offset(0, value),
                  //       child: child,
                  //     );
                  //   },
                  //   child: PetCard(pet: pet),
                  // );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
