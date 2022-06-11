

class RegisterModel {
  final String full_name;
  final String email;
  final String password;

  RegisterModel({
    required this.full_name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      "full_name":full_name,
      "email": email,
      "password": password,
      "device_name":'web',
      "country":'NG',
    };
  }
}