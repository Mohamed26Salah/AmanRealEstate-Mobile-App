import 'package:aman_project/data/image_management.dart';
import 'package:aman_project/presentation/properties/show_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../data/repositories/user_providers.dart';
import 'filter.dart';
import '../../data/repositories/properties_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Search extends ConsumerStatefulWidget {
  const Search({super.key});

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  final _inputSearchController = TextEditingController();
  @override
  void dispose() {
    _inputSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    final userData = ref.watch(newUserDataProivder);
    bool isVisible = false;
    if (userData?.role == 'admin' || userData?.role == 'moderator') {
      setState(() {
        isVisible = true;
      });
    }
    if (ref.watch(filterTypeProivder) != "" ||
        ref.watch(filterRoomProivder) != "" ||
        ref.watch(filterBathroomProivder) != "" ||
        ref.watch(filterPriceProivder) != "") {
      _inputSearchController.text = "";
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
                  ref.read(searchInputProivder.notifier).state = value;
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
                        IconButton(
                            onPressed: () {
                              _showBottomSheet();
                              // clearProivders(ref);
                              // ref.read(searchInputProivder.notifier).state = "";
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Theme.of(context).primaryColor,
                              size: 28,
                            )),
                        IconButton(
                            onPressed: () {
                              clearAllProivders(ref);
                            },
                            icon: Icon(
                              Icons.restore,
                              color: Theme.of(context).primaryColor,
                              size: 28,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 24, left: 24, top: 10, bottom: 0),
              //war top 24
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ref.watch(resultsCountProperty).toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  textType(),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ShowCard()),
            ),
          ],
        ),
        // bottomNavigationBar: NavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/addForm').then((value) {
                ImageManagement().clearImageProivders(ref);
              });
              // context.push('/addFormUnits');
            },
          ),
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

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        builder: (BuildContext context) {
          return Wrap(
            children: const [
              Filter(),
            ],
          );
        });
  }

  Widget textType() {
    var type = "Properties".tr;
    if (ref.watch(filterTypeProivder) != "" ||
        ref.watch(filterRoomProivder) != "" ||
        ref.watch(filterBathroomProivder) != "" ||
        ref.watch(filterPriceProivder) != "") {
      type = "Filtered Properties".tr;
    }
    if (ref.watch(searchInputProivder) != "") {
      type = "Searched Properties".tr;
    }
    return Text(
      type,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }
}
