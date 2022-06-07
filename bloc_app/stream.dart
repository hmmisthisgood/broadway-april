import 'dart:async';

StreamController<int> streamController = StreamController.broadcast();
int value = 0;
main() {
  Stream<int> numbersSTream = Stream.empty();

  Timer.periodic(Duration(milliseconds: 1), (timer) {
    value = value + 2;
    streamController.add(value);
  });

  streamController.stream.listen(
    (event) {
      print(event);
    },
    onError: (e) {
      print(e);
    },
  );
}
