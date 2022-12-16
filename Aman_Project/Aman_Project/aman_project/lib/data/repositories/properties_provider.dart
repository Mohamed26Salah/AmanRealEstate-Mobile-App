import 'package:flutter_riverpod/flutter_riverpod.dart';

final propertiesLength = StateProvider<int>((ref) {
  return 0;
});
final searchInputProivder = StateProvider<String>((ref) {
  return "";
});
