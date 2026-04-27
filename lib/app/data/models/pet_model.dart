class PetModel {
  final int id;
  final String name;
  final String status;

  PetModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      name: json['name'] ?? '',
      status: json['status'] ?? '',
    );
  }
}