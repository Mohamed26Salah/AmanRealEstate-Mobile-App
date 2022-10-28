class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? password;
  String? email;

  Users({
    required int this.id,
    required String this.firstName,
    required String this.lastName,
    required String this.password,
    required String this.email,
  });
}

List<Users> getUsersList() {
  return <Users>[
    Users(
        id: 0,
        firstName: "Mohamed",
        lastName: "Salah",
        password: "MyBABY123",
        email: "mohamedsalahomran44@gmail.com"),
    Users(
        id: 1,
        firstName: "farah",
        lastName: "Salah",
        password: "secoundBABY123",
        email: "farahsalahomran44@gmail.com"),
    Users(
        id: 2,
        firstName: "Rowaida",
        lastName: "Salah",
        password: "thirdBABY123",
        email: "Rowaidasalahomran44@gmail.com"),
  ];
}
