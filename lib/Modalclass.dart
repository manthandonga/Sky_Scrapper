class Detail {
  final String state;
  final int cases;

  Detail({
    required this.cases,
    required this.state,
  });

  factory Detail.fromJson(Map<String, dynamic> json, String state, String val) {
    return Detail(
      cases: json[state]["districtData"][val]["active"],
      state: state,
    );
  }
}

List<String> iState = <String>[
  "Andhra Pradesh",
  "Arunachal Pradesh",
  "Assam",
  "Bihar",
  "Chhattisgarh",
  "Delhi",
  "Goa",
  "Gujarat",
  "Himachal Pradesh",
  "Haryana",
  "Jharkhand",
  "Jammu and Kashmir",
  "Karnataka",
  "Madhya Pradesh",
  "Manipur",
  "Mizoram",
  "Odisha",
  "Punjab",
  "Rajasthan",
  "Sikkim",
  "Telangana",
  "Uttar Pradesh",
  "Uttarakhand",
  "West Bengal",
];
List<String> stateval = <String>[
  "Foreign Evacuees",
  "Anjaw",
  "Airport Quarantine",
  "Araria",
  "Other State",
  "Central Delhi",
  "Other State",
  "Other State",
  "Bilaspur",
  "Ambala",
  "Bokaro",
  "Anantnag",
  "Bagalkote",
  "Agar Malwa",
  "CAPF Personnel",
  "Aizawl",
  "State Pool",
  "Amritsar",
  "Ajmer",
  "East Sikkim",
  "Foreign Evacuees",
  "Agra",
  "Almora",
  "Alipurduar",
];
