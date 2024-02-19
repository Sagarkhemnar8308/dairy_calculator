class UserModel {
  final String? id;
  final String? firstname;
  final String? pincode;
  final String? surname;
  final String? village;

  const UserModel({
    this.id,
    required this.firstname,
    required this.pincode,
    required this.surname,
    required this.village,
  });

  toJson() {
    return {
      "Firstname": firstname,
      "Pincode": pincode,
      "Surname": surname,
      "Village": village
    };
  }
}
