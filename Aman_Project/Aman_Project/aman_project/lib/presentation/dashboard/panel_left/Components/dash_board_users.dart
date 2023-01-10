import 'package:aman_project/presentation/dashboard/panel_left/Components/users_list_widget.dart';
import 'package:flutter/material.dart';

class DashBoardUsers extends StatefulWidget {
  const DashBoardUsers({super.key});

  @override
  State<DashBoardUsers> createState() => _DashBoardUsersState();
}

class _DashBoardUsersState extends State<DashBoardUsers> {
  String? query;
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
            onChanged: (value) {
              setState(() {
                query = value;
              });
            },
            onSubmitted: (value) {
              setState(() {
                query = value;
              });
            },
            style: const TextStyle(
              fontSize: 28,
              height: 1,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'Search',
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
        SizedBox(
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
                child: UsersListWidget(query: query)),
          ),
        ),
      ],
    );
  }
}
