class Client {
  
  int id;
  String name;
  String email;
  String password;

  Client({
    id,
    name,
    email,
    password,
  });

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}