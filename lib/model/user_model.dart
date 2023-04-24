class UserModel {
  String name;
  String email;
  String phoneNumber;
  String address;
  String aadhar;
  String pan;
  String createdAt;
  String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.aadhar,
    required this.pan,
    required this.createdAt,
    required this.uid,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      aadhar: map['aadhar'] ?? '',
      pan: map['pan'] ?? '',
      createdAt: map['createdAt'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "aadhar": aadhar,
      "pan": pan,
      "createdAt": createdAt,
      "uid": uid,
    };
  }
}
