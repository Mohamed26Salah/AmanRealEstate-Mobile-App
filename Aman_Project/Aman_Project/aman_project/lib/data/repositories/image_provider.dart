import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageFileProivder = StateProvider<File?>((ref) {
  return null;
});

final imagesListFileProivder = StateProvider<List<File?>>((ref) {
  return [];
});
