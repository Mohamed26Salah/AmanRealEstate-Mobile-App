import 'package:aman_project/data/repositories/rents_provider.dart';
import 'package:aman_project/presentation/rents/show_rents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/user_providers.dart';

class MainPageRent extends ConsumerStatefulWidget {
  const MainPageRent({super.key});
  @override
  ConsumerState<MainPageRent> createState() => _SearchState();
}

class _SearchState extends ConsumerState<MainPageRent> {
  final _inputSearchController = TextEditingController();
  @override
  void dispose() {
    _inputSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String rentType = ModalRoute.of(context)!.settings.arguments.toString();
    final userData = ref.watch(newUserDataProivder);
    bool isVisible = false;
    if (userData?.role == 'admin') {
      setState(() {
        isVisible = true;
      });
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // bottomNavigationBar: const NavBarGR(),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 48, left: 24, right: 24, bottom: 0),
              child: TextField(
                controller: _inputSearchController,
                autofocus: false,
                enableInteractiveSelection: false,
                // onChanged: (value) {
                //   ref.read(searchInputProivder.notifier).state = value;
                // },
                onSubmitted: (value) {
                  ref.read(searchInputProivderRent.notifier).state = value;
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // added line
                      mainAxisSize: MainAxisSize.min, // a
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:  Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.grey[400],
                            size: 28,
                          ),
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(right: 24, left: 24, top: 10, bottom: 12),
              //war top 24
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ShowRent(rentType: rentType)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilter(String filterName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: Colors.grey.withOpacity(0.1),
            width: 1,
          )),
      child: Center(
        child: Text(
          filterName,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
