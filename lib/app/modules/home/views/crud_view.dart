import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_store/app/modules/home/controllers/home_controller.dart';

class CrudView extends GetView<HomeController> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  CrudView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD API")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔤 Name Input
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Pet Name"),
            ),

            // 🔢 ID Input
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: "Pet ID"),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),

            // 🟢 ADD BUTTON
            ElevatedButton(
              onPressed: () {
                controller.addPet(nameController.text);
              },
              child: Text("Add Pet"),
            ),

            // 🟡 UPDATE BUTTON
           

          
            SizedBox(height: 20),

            // 🔄 Loading
            Obx(() {
              return controller.isLoading.value
                  ? CircularProgressIndicator()
                  : SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}