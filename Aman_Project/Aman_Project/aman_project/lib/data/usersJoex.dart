class Users{
  String? name;
  String? email;
  String? passwrod;

  Users({this.name , this.email , this.passwrod});


}

List <Users> getUsers() {
  return <Users> [
    Users(name: "Youssef", email: "Youssef@gmail.com", passwrod: "y32135"),
    Users(name: "Ahmed", email: "Ahmed@gmail.com", passwrod: "a21234"),
  ];
}