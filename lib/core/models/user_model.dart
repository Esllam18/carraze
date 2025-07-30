class UserModel {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String info;
  final String? image; // Made image nullable

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.info,
    this.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      info: map['info'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone,
      'info': info,
      'image': image,
    };
  }
}
