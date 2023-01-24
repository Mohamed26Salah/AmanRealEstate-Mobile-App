import 'package:aman_project/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Salah Way
// final userDataProviderRepository = StateProvider<Future?>(
//   (ref) => null,
// );

// final userDataProvider = FutureProvider((ref) async {
//   return ref.watch(userDataProviderRepository);
// });

// Yasser Way
final newUserDataProivder = StateProvider<UserModel?>((ref) {
  return null;
});

final usertDataProv = StateProvider<List<UserModel>>((ref) {
  return [UserModel.alternate()];
});
final queryProv = StateProvider<String>((ref) {
  return '';
});
