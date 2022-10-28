class propchange implements Comparable<propchange> {
  final String name, code, type;
  bool enable;
  propchange(this.type, this.name, this.code, {this.enable = true});

  @override
  int compareTo(propchange other) => name.compareTo(other.name);
}

var properties = [
  propchange("flat", 'Mike', 'A15'),
  propchange("villa", 'Todd', 'B45'),
  propchange("villa", 'Ahmad', 'A12'),
  propchange("villa", 'Anthony', 'D98'),
  propchange("flat", 'Annette', 'C23'),
];
