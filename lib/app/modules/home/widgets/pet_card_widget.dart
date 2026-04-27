// import 'package:flutter/material.dart';
// import 'package:pets_store/app/data/models/pet_model.dart';
// import 'package:pets_store/app/modules/home/controllers/home_controller.dart';

// class PetCard extends StatelessWidget {
//   final PetModel pet;
//     final HomeController controller = Get.put(HomeController());


//    PetCard({super.key, required this.pet});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         leading: CircleAvatar(
//           child: Text((pet.name.isNotEmpty) ? pet.name[0].toUpperCase() : "?"),
//         ),
//         title: Text(pet.name, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(pet.status),
//          // 🗑️ Delete
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [

//                     IconButton(
//                       icon: Icon(Icons.edit, color: Colors.blue),
//                       onPressed: () {
//                         controller.updatePet(pet);
//                       },
//                     ),

//                     IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       onPressed: () {
//                         controller.deletePet(pet.id);
//                       },
//                     ),
//                   ],
//                 ),
//       ),
//     );
//   }
// }
