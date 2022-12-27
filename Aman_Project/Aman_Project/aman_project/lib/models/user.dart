// ignore_for_file: file_names

class UserModel {
  String email;
  String role;
  UserModel(this.email, this.role);
  int compareTo(UserModel other) => email.compareTo(other.email);
}
