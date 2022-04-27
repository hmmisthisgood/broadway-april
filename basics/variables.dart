main() {
  // this value is used for some purposes
  var thisIsAValue = 10.0;
  // thisIsAValue = "10";

  /// numeric values:
  ///

/*
These are the data types 
*/

  int age = 10;
  // age = "years";
  age = 100;
  age = 5000;

  /// incorrect
  // age = 1000.0;

  // age = false;
  double price = 100.45;
  price = 10;
  print("Price is $price");

  /// declaration
  double discount;

  /// definition
  discount = 10;

  num figures = 10.0;
  figures = 100;
  figures = 100.0;

  /// String values
  String name = "Some      guy";
  // name = 100;

  // var combined = discount + name;

  /// boolean values
  bool isRaining = false;

  bool isMorning = true;

// var true="";

  /// dynamic
  dynamic anything = "some random value";

  print("These are the dynamic values:");

  print(anything);
  anything = 100;

  print(anything);

  anything = false;

  print(anything);

  /// This causes error
  // anything = anything + 10;
  print(anything);

  final cupWinner = "csk";
  // cupWinner = "csk";

  final currentTime = DateTime.now();
// currentTime=DateTime.now();
  print(currentTime.toLocal());

  // currentTime = DateTime.now();

  const PI = 22 / 7;
  // PI = 3.1415;
}

/////