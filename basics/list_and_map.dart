main() {
  // implicit/indirect type infernce
  final students = [
    "Bijay",
    1,
    3,
    [1, 3, 4]
  ];
  // students = [1, 2, 4];

  /// 0, 1, .... n
  List<int> rollNmber = [88, 3, 45, 100, 3435, 32];
  // position/index       0, 1, 2 ,3 ,4 5

  var someValue = rollNmber[1];
  print(someValue);

  List<String> cars = ["tata", "ferrari"];

//'

  List<int> roll = [12, 3];

  // // roll = roll[1];
  // roll = 13;

  var value = roll[1];

  print(value);

// Key-Value Pair
// Collection of Key value pairs
  Map<dynamic, dynamic> user = {
    "id": 23434,
    "name": "Ram Prasad",
    "date_of_birth": "1997",
    "salary": [1, 4, 4, 5],
    1: 2
  };
}
