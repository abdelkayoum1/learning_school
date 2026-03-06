class Modelname {
  final String name, email;

  Modelname({required this.name, required this.email});

  factory Modelname.fromJson(Map<String, dynamic> json) {
    return Modelname(name: json['name'], email: json['email']);
  }
}
