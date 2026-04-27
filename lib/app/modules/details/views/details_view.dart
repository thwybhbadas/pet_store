import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ID: ${controller.pet.id}"),
            Text("Name: ${controller.pet.name}"),
            Text("Status: ${controller.pet.status}"),
          ],
        ),
      ),
    );
  }
}