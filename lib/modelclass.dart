class Detail {
  final String img;
  final String fName;
  final String lName;
  final String gender;
  final String dob;
  final int age;
  final String phoneNumber;
  final String emailId;
  final String city;
  final String state;
  final String country;
   var code;

  Detail({
    required this.img,
    required this.fName,
    required this.lName,
    required this.dob,
    required this.country,
    required this.age,
    required this.city,
    required this.gender,
    required this.emailId,
    required this.phoneNumber,
    required this.state,
    required this.code,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      img: json["results"][0]["picture"]["large"],
      fName: json["results"][0]["name"]["first"],
      country: json["results"][0]["location"]["country"],
      lName: json["results"][0]["name"]["last"],
      city: json["results"][0]["location"]["city"],
      age: json["results"][0]["dob"]["age"],
      code: json["results"][0]["location"]["postcode"],
      gender: json["results"][0]["gender"],
      phoneNumber: json["results"][0]["phone"],
      dob: json["results"][0]["dob"]["date"],
      emailId: json["results"][0]["email"],
      state: json["results"][0]["location"]["state"],
    );
  }
}
