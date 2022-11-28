import 'package:aman_project/data/data.dart';
import 'package:aman_project/data/rent_data.dart';
import 'package:aman_project/firebase_options.dart';
import 'package:aman_project/theme/theme_constants.dart';
import 'package:aman_project/theme/theme_manager.dart';
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

ThemeManager _themeManager = ThemeManager();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  String initialPath = "/";
  Search homePage = Search();
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
            builder: (context, state) =>
                EditProfile(themeManager: _themeManager),
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
    MyWidget(router: router),
  );
}

class MyWidget extends StatefulWidget {
  final GoRouter router;
  MyWidget({super.key, required this.router});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: widget.router.routeInformationProvider,
      routeInformationParser: widget.router.routeInformationParser,
      routerDelegate: widget.router.routerDelegate,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
    );
  }
}
