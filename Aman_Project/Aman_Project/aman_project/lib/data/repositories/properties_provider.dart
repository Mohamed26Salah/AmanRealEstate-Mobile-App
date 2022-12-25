import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Search
final searchInputProivder = StateProvider<String>((ref) {
  return "";
});

//Filters
final filterPriceProivder = StateProvider<RangeValues>((ref) {
  return const RangeValues(10000, 10000000);
});
final filterAreaProivder = StateProvider<RangeValues>((ref) {
  return const RangeValues(10, 3000);
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
