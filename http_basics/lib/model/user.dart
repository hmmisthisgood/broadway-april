import './company.dart';

var somejson = {
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {"lat": "-37.3159", "lng": "81.1496"}
  },
  "phone": "1-770-736-8031 x56442",
  "website": null,
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
};

class User {
  final int id;
  final String name, username, email, phone;
  final String website;
  final address;
  final Company? company;
  final String companyName;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
    required this.companyName,
  });

  factory User.convertFromJson(Map json) {
    final value = json['address'];
    return User(
      id: json['id'] ?? -1,
      name: json['name'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      // website: json['wesbite'] == null ? "" : json['website'],
      website: json['wesite'] ?? "",
      // bad way:::  website: json.containsKey("website") ? json['website'] : "",
      address: "",
      company:
          json['company'] == null ? null : Company.convert(json['company']),
      companyName: json['company']['name'],
    );
  }
}
