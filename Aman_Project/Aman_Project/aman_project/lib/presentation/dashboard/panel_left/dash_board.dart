import 'package:aman_project/presentation/dashboard/panel_left/Components/dash_board_users.dart';
import 'package:flutter/material.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';
import 'Components/card_block.dart';
import 'Components/admin_numbers.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: NoGlowScroll(
          child: ListView(
            children: [
              Column(
                children: [
                  const DashboardUsers(),
                  const AdminNumbers(),
                  Wrap(alignment: WrapAlignment.center, children: const [
                    CardBlock(),
                    CardBlock(
                      dataNum: 1,
                    ),
                    CardBlock(
                      dataNum: 2,
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
