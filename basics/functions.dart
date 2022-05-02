main() {
  int a;
  a = 10;

  // Function calculateInterest = (int p, int t, int  r) {
  //   return p * t * r / 100;
  // };

  // calculateInterest();

  /// function call
  ///

  num areaR = area(10, 5);
  print("The area of rectangle is $areaR");

  num si = simpleInterest(rate: 10, time: 2, principal: 210000);

  print("The interest is $si");
}

/// function definition
num area(num l, num b) {
  num tempArea = l * b;

  return tempArea;
}

num simpleInterest(
    {required int principal, required num rate, required num time}) {
  var si = (principal * rate * time) / 100;
  return si;
}
