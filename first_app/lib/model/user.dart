class User {
  final String email, profilePicture, username;
  final int id;

  User(
      {required this.email,
      required this.profilePicture,
      required this.username,
      required this.id});

  factory User.convertFromJson(Map json) {
    return User(
        email: json['email'],
        profilePicture: json['profile_picture'],
        username: json['username'],
        id: json['id']);
  }

  Map toJson() {
    return {
      "email": email,
      "id": id,
      "profile_picture": profilePicture,
      "username": username,
    };
  }
}
