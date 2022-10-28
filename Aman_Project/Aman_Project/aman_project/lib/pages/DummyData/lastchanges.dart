class propchange implements Comparable<propchange> {
  final String name, code, type;
  bool enable;
  propchange(this.type, this.name, this.code, {this.enable = true});

  @override
  int compareTo(propchange other) => name.compareTo(other.name);
}

class rent implements Comparable<rent> {
  final String name, code, type;
  bool enable;
  rent(this.type, this.name, this.code, {this.enable = true});

  @override
  int compareTo(rent other) => name.compareTo(other.name);
}

var properties = [
  propchange("flat", 'Mike', 'A15'),
  propchange("villa", 'Todd', 'B45'),
  propchange("villa", 'Ahmad', 'A12'),
  propchange("villa", 'Anthony', 'D98'),
  propchange("flat", 'Annette', 'C23'),
];

var rents = [
  rent("flat", 'Mike', 'A15'),
  rent("School", 'Todd', 'B45'),
  rent("Factory", 'Ahmad', 'A12'),
  rent("Other", 'Anthony', 'D98'),
  rent("Hospital", 'Annette', 'C23'),
];
