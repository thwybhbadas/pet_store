import 'package:flutter/material.dart';
import 'package:pets_store/app/data/models/pet_model.dart';

class PetCard extends StatelessWidget {
  final PetModel pet;

  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          child: Text((pet.name.isNotEmpty) ? pet.name[0].toUpperCase() : "?"),
        ),
        title: Text(pet.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(pet.status),
      ),
    );
  }
}
