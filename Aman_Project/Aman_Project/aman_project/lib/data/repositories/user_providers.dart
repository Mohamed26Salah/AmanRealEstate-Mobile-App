import 'package:aman_project/data/user_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future userData = UserHelper().getUserData();
final userDataProviderRepository = StateProvider<Future>(
  (ref) => userData,
);
//Reads the value first time 8er kda 5las msh hy5osh database again
final userDataProvider = FutureProvider((ref) async {
  return ref.watch(userDataProviderRepository);
});

// Future userEmail = UserHelper().getUserEmail();
// final userEmailProviderRepository = StateProvider<Future>(
//   (ref) => userEmail,
// );
// //Reads the value first time 8er kda 5las msh hy5osh database again
// final userEmailProvider = FutureProvider((ref) async {
//   return ref.watch(userEmailProviderRepository);
// });

// Future userRole = UserHelper().getUserRole();
// final userRoleProviderRepository = StateProvider<Future>(
//   (ref) => userRole,
// );

// final userRoleProvider = FutureProvider((ref) async {
//   return ref.watch(userRoleProviderRepository);
// });
