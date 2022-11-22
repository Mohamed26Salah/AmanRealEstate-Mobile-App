import 'package:aman_project/data/data.dart';
import 'package:aman_project/data/rent_data.dart';
import 'package:aman_project/firebase_options.dart';
import 'package:aman_project/widgets/AddForm.dart';
import 'package:aman_project/widgets/edit_profile.dart';
import 'package:aman_project/widgets/nav_bar_gr.dart';
import 'package:aman_project/widgets/property_description.dart';
import 'package:aman_project/widgets/rent_Type.dart';
import 'package:aman_project/widgets/search.dart';
import 'package:aman_project/widgets/wish_list.dart';
import 'package:firebase_core/firebase_core.dart';
import './widgets/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/widgets/rent.dart';
import 'pages/panel_left/panel_left_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  String initialPath = "/";
  Search homePage = const Search();
  LoginPage loginPage = LoginPage();
  final GoRouter router = GoRouter(
    initialLocation: initialPath,
    routes: <GoRoute>[
      GoRoute(
        path: initialPath,
        builder: (context, state) => homePage,
        routes: [
          GoRoute(
            path: 'addFormUnits',
            builder: (context, state) => AddForm(),
          ),
          GoRoute(
            path: 'details',
            builder: (context, state) =>
                Details(property: state.extra as Property),
          ),
          GoRoute(
            path: 'Rents',
            builder: (context, state) => const RentsPage(),
            routes: [
              GoRoute(
                  path: 'RentType/:id',
                  builder: (BuildContext context, GoRouterState state) =>
                      RentType(rentID: int.parse(state.params["id"]!))),
            ],
          ),
          GoRoute(
            path: 'WishList',
            builder: (context, state) => wish_list(),
          ),
          GoRoute(
            path: 'Profile',
            builder: (context, state) => const EditProfile(),
          ),
          GoRoute(
            path: 'Dashboard',
            builder: (context, state) => PanelLeftPage(),
          ),
          // PanelLeftPage
        ],
      ),
    ],
  );
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    ),
  );
}
