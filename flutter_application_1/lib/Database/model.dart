// class ContactModel {
//   int? id; //untuk identitas data
//   String? name;
//   String? phone;
//   String? image;
//   ContactModel({required this.id, this.name, required this.phone, required this.image});

//   factory ContactModel.fromJson(Map<String, dynamic> map) {
//     return ContactModel(
//       id: map['id'],
//       name: map['name'],
//       phone: map['phone'],
//       image: map['image'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'phone': phone,
//       'image': image,
//     };
//   }
// }


class ContactModel {
  int? id;
  String? name;
  String? phone;
  String? email;

  ContactModel({
    this.id, // ❗ gak perlu required
    this.name,
    this.phone,
    this.email,
  });

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['image'], 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      // ❗ JANGAN masukin image kalau DB belum ada kolomnya
    };
  }
}