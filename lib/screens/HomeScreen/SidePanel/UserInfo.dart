class UserInfo {
  final String name;
  final String email;
  final String age;

  UserInfo({this.name, this.email, this.age});

  UserInfo.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'age': this.age,
        'email': this.email,
      };
}
