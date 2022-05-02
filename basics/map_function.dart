main() {
  List<String> countries = ["nepal", "china", "india"];

  Map users = {"id": 12312, "name": "jeff", "age": 50};

  countries.forEach((element) {});

  var newC = countries.map(
    (country) {
      var temp = "This is $country";
      return temp;
    },
  ).toList();

  print(newC);

  // users.map((key, value) {});
}

bool compareValues(int a, int b) => a < b;
