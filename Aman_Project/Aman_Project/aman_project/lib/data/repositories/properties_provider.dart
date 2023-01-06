import 'package:flutter_riverpod/flutter_riverpod.dart';

//Search
final searchInputProivder = StateProvider<String>((ref) {
  return "";
});

final filterPriceProivder = StateProvider<String>((ref) {
  return "";
});
final filterTypeProivder = StateProvider<String>((ref) {
  return "";
});
final filterRoomProivder = StateProvider<String>((ref) {
  return "";
});
final filterBathroomProivder = StateProvider<String>((ref) {
  return "";
});
//MainPage
final resultsCount = StateProvider<int>((ref) {
  return 0;
});
