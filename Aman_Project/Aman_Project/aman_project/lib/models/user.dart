// ignore_for_file: file_names

class User {
  String email;
  String role;
  User(this.email, this.role);
  int compareTo(User other) => email.compareTo(other.email);
}
