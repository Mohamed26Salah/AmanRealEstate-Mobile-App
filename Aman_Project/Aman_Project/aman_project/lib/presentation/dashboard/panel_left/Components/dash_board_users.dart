import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/data/user_management.dart';
import 'package:aman_project/presentation/dashboard/panel_left/Components/users_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class DashboardUsers extends ConsumerStatefulWidget {
  const DashboardUsers({super.key});

  @override
  ConsumerState<DashboardUsers> createState() => _DashboardUsersState();
}

class _DashboardUsersState extends ConsumerState<DashboardUsers> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 0),
          child: TextField(
            autofocus: false,
            enableInteractiveSelection: false,
            // onChanged: (value) {
            //   ref.read(searchInputProivder.notifier).state = value;
            // },
            onChanged: (value) async {
              ref.read(queryProv.notifier).state = value;
              ref.read(usertDataProv.notifier).state =
                  await UserHelper.getUsersRolesEmails(query: value);
              setState(() {});
            },
            onSubmitted: (value) async {
              ref.read(queryProv.notifier).state = value;
              ref.read(usertDataProv.notifier).state =
                  await UserHelper.getUsersRolesEmails(query: value);
              setState(() {});
            },
            style: const TextStyle(
              fontSize: 28,
              height: 1,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'Search'.tr,
              hintStyle: TextStyle(
                fontSize: 28,
                color: Colors.grey[400],
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: (Colors.grey[400])!,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: (Colors.grey[400])!,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: (Colors.grey[400])!,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // added line
                  mainAxisSize: MainAxisSize.min, // added li
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey[400],
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.shortestSide / 1.3,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
                // color: ,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const UsersListWidget()),
          ),
        ),
      ],
    );
  }
}
