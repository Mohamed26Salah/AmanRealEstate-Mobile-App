import 'package:aman_project/presentation/dashboard/panel_left/Components/dash_board_users.dart';
import 'package:flutter/material.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';
import 'Components/card_block.dart';
import 'Components/admin_numbers.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

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
