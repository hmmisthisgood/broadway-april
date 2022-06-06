main() async {
  print("1.Hello");
  // final data = someAsyncCode();

  // data.then((value) {
  //   print(value);
  // }).catchError((e) {
  //   ///
  // });

  try {
    final data = await someAsyncCode();
    print(data);
  } catch (e, s) {
    print(e);
  }

  print("4.The should be last");
}

Future<String> someAsyncCode() async {
  print("2.I am running inside Async Code");

  Future.delayed(Duration(seconds: 2), () {
    print("3..This might be delayed");
  });

  return "Hello Async code";
}



// async , await 
// Future 
// then , catchError
// Completer , resolve 
