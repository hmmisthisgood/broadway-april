//  { "name": "Romaguera-Crona",
//   "catchPhrase": "Multi-layered client-server neural-net",
//   "bs": "harness real-time e-markets"
// }

class Company {
  final String name, catchPhrase, bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.convert(Map json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
