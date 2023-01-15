import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/models/number.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProv = StateProvider<List<Number>>((ref) {
  return [];
});
