import 'package:aman_project/models/user_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future userEmail = UserHelper().getUserEmail();
final userEmailProviderRepository = StateProvider<Future>(
  (ref) => userEmail,
);
//Reads the value first time 8er kda 5las msh hy5osh database again
final userEmailProvider = FutureProvider((ref) async {
  return ref.watch(userEmailProviderRepository);
});

Future userRole = UserHelper().getUserRole();
final userRoleProviderRepository = StateProvider<Future>(
  (ref) => userRole,
);

final userRoleProvider = FutureProvider((ref) async {
  return ref.watch(userRoleProviderRepository);
});
