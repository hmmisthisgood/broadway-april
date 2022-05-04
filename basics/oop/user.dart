class User {
  /// this is a constructor
  User(
      {required this.id,
      this.age = 0,
      required this.username,
      required this.email,
      required this.role,
      required String ccNumber})
      : this._creditCardNumber = ccNumber;

  int id;
  String username;
  String email;
  int? age;
  String role;

  String _creditCardNumber;

  String get cc => _creditCardNumber;

  set ccN(String value) => _creditCardNumber = value;

  static String country = "Nepal";
  static peformTask() {}

  login() {
    print("Yay I'm logged in: ${this.username}");
  }
}

// object/instance

/// Admin = sub class
/// User= super class or base class
class Admin extends User {
  Admin({
    required int age,
    required int id,
    required String email,
    required String username,
    required String ccNumber,
    required this.phoneNo,
  }) : super(
            age: age,
            id: id,
            email: email,
            username: username,
            ccNumber: ccNumber,
            role: "admin");

  String phoneNo;

  deleteUser() {}
  updateUser() {}
  blockUser() {}

  @override
  login() {
    print("I am logging in from admin");
    // super.login();
  }
}

class Client extends User {
  Client({
    required int age,
    required int id,
    required String email,
    required String username,
    required String ccNumber,
  }) : super(
            age: age,
            id: id,
            email: email,
            username: username,
            ccNumber: ccNumber,
            role: "client");

  uploadPhoto() {
    print(" i am uploading photo");
  }

  sendMessage() {
    print(" Message sent");
  }

  @override
  login() {
    print("\n i am loggin in from Cleint");

    // return super.login();
  }
}

abstract class Geometry {
  area(int length, int breadth);
  perimeter(int legth, int breadth);
}

class Square extends Geometry {
  @override
  area(int length, int breadth) {
    return length * length;
  }

  @override
  perimeter(int legth, int breadth) {
    return 4 * legth;
  }
}

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

  // jamesBond.login();

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

  // spiderMan.login();

  Admin admin = Admin(
      age: 50,
      id: 1233123,
      email: "admin@admin.com",
      username: "iamadmin",
      phoneNo: "9841000000",
      ccNumber: "1244242");

  admin.login();
  admin.deleteUser();

  Client client = Client(
      age: 50,
      id: 1233123,
      email: "cleint@cleint.com",
      username: " i am clinet",
      ccNumber: "1244242");
  client.login();
  // client.uploadPhoto();
  // client.sendMessage();

  User.country;
  User.peformTask();
}
