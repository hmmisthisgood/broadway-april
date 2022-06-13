extension TextExtension on String {
  String capitalize() {
    final splitted = this.split(" ");

    final captial = splitted.map<String>((e) {
      var first = e[0];
      first = first.toUpperCase();
      return first;
    }).toList();

    return captial.join(" ");
  }

  String makeSmall() {
    return this;
  }
}
