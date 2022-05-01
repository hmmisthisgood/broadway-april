main() {
  /// for
  /// for each
  /// for in
  ///

  List<String> names = ['Ram', "Hari", "Jack", "Jeff", "Dell"];

  int i = 0;

  // for(i=0=i<5;)
  for (i; i < 5;) {
    // i =4

    final n = names[i];
    print("My name is $n");

    // /// hari ==hari
    // if (n.toLowerCase() == "HAri".toLowerCase()) {
    //   names.remove("hari");
    // }

    if (i == 2) {
      break;
    }
    i++;
    if (i == 0) {
      continue;
    }

    print("Below continue $n");
  }

  /// for each
  names.forEach((item) {
    print("My name from forEach is : $item");
  });

  /// for in

  for (var person in names) {
    ///
    print("My name from for in is: $person");
  }

  /// while

  int day = 0;

  // while (day < 5) {
  //   print("I am still running");
  //   day = day + 2;
  // }

  /// do while
  do {
    print("do while $day");
    day = day + 2;
  } while (day < 5);
}
