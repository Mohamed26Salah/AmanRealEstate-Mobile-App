import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Search
final searchInputProivder = StateProvider<String>((ref) {
  return "";
});
//Filters
final filterPriceProivder = StateProvider<RangeValues>((ref) {
  return const RangeValues(15000, 1000000);
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
