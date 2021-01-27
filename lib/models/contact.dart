class Contact {
  final String name;
  final String email;
  final String phone;

  Contact(this.name, this.email, this.phone);

  Contact.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'];
}
