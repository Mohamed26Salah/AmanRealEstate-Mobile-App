// ignore_for_file: file_names

class Person implements Comparable<Person> {
  final String name, surname;
  bool enable;
  Person(this.name, this.surname, {this.enable = true});

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}
