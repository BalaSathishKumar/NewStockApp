class UserModel {
  final String username;
  final String useremail;
  final String? filePath; // Use String? to represent an optional file path

  UserModel({
    required this.username,
    required this.useremail,
    this.filePath,
  });
}



