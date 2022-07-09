class User {
  String fname;
  String lname;
  String username;
  String password;

  User(
      {required this.fname,
      required this.lname,
      required this.username,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json["username"],
        password: json["password"],
        fname: json["firstName"],
        lname: json["lastName"]);
  }
}
