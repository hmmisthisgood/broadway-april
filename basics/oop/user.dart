class User {
  /// this is a constructor
  User(
      {required this.id,
      this.age = 0,
      required this.username,
      required this.email,
      required this.role,
      required String ccNumber})
      : _creditCardNumber = ccNumber;

  int id;
  String username;
  String email;
  int? age;
  String role;

  String _creditCardNumber;

  String get cc => _creditCardNumber;

  set ccN(String value) => _creditCardNumber = value;

  login() {
    print("Yay I'm logged in: ${this.username}");
  }
}

// object/instance

main() {
  User jamesBond = new User(
    age: 45,
    id: 1244214,
    email: "a@b.com",
    username: "@bond",
    role: "user",
    ccNumber: "1111 45444 555",
  );

  jamesBond.age = 50;
  jamesBond.username = "@notBond";

  print("James Bonds details: Name : ${jamesBond.username}");

  jamesBond.login();

  jamesBond.ccN = "11111 1111";

  String jamesBondCC = jamesBond.cc;

  print(jamesBond.cc);

  User spiderMan = User(
      // age: 16,
      id: 4444,
      email: "spider@b.com",
      username: "spider",
      role: "role",
      ccNumber: "1111 5555");

  spiderMan.login();
}
