main() {
  /// arthematic operators : + - / * %
  /// Logical operaots : ==, && , || , ! , <

  int length = 100;
  int breadth = 50;
// , > , <=, >=
  int perimeter = length + length + breadth + breadth;

  print("The perimeter is ${perimeter + 5000}");

  int difference = length - breadth;
  print("The difference is: $difference");

  int area = length * breadth;
  print("The area is: $area");

  num division = length / breadth;

  /// logical
  ///

  var eqaual = 10 == 100;
  var negation = 10 != 100;
  var greater = 1000 > 50;
  var less = 100 < 1000;

  /// ternary operator
  /// is short cut form of if-else

  // condition ?---------- : ***************

  length == 100 ? print("length is 100") : print("length is not 100");

  /// Null realted operators: ??  ,  ?. , ? somethin!

  // var a = null;

  int? something; //
  // something = 1000;
  int newValue = something ?? 0;

  if (something != null) {
    int random = something + 100;
  }

  // int = Never null
  // int?= can be null
}
