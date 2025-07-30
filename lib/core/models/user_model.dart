class UserModel {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String info;
  final String? image;

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
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      info: map['info'] ?? '',
      image: map['image'], // ممكن تكون null ومفيش مشكلة
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
