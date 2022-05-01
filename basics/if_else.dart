main() {
  String day = "sunday";

  print("Using if else");

// if , else, elseif , switch

  if (day == "sunday") {
    ///
    print("Today is Sunday");
  } else if (day == "monday") {
  } else if (day == "tuesday") {
  } else {
    ///
    print("Today is not sunday");
  }

  // if (1) {}
  // if (false) {}

  if (day == "staurday" ||
      day == "sunday" ||
      day == "public holday" ||
      day == "nepal banda") {
    print("Yay holiday");
  } else {
    print("Nay");
  }

  if (day == "lastday" && day == "sunday") {}

  if (!(day != "Saturday")) {
    // if (!true) , if (!false)
    print("Not holiday");
  }

  switch (day) {
    case "sunday":
      print("Hello sunday");
      break;
    case "monday":
      print("not hello monday");
      break;
    default:
      print("This is defaul");
  }
}
