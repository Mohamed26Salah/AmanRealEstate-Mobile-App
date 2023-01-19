import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/repositories/properties_provider.dart';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/property.dart';
import 'package:aman_project/presentation/shared_features/custom_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'property_widget_card.dart';

class Wishlist extends ConsumerStatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  ConsumerState<Wishlist> createState() => WishlistState();
}

class WishlistState extends ConsumerState<Wishlist> {
  late Database _database;
  late List<Map<String, dynamic>> _favorites;
  List<Property> resultWhishlist = [Property.alternate()];
  @override
  void initState() {
    _openDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    resultWhishlist = ref.watch(whishlistProvider);
    return resultWhishlist.isEmpty
        ? SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Image.asset("assets/images/wishlist.png", width: 200),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Your WishList is Empty!',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Esplore more and shortlist some items',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/home");
                    },
                    child: const Text('Start SHOPPING'),
                  ),
                ])),
          )
        : resultWhishlist[0].docId == '-1'
            ? const Center(child: LoadingScreen())
            : SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topCenter,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(13)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Your Wishlist'.tr,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Icon(
                                Icons.favorite,
                                color: Theme.of(context).primaryColor,
                                size: 35,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 170),
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: ref.watch(whishlistProvider).length,
                              itemBuilder: (context, index) {
                                return PropertyWidget(
                                  property: ref.watch(whishlistProvider)[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }

  void _openDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = "${databasesPath}favs.db";
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE favs (id INTEGER PRIMARY KEY AUTOINCREMENT, propid TEXT , email TEXT,CONSTRAINT propid_uniqe UNIQUE (propid,email))');
      },
    );
    _loadFavorites();
  }

  void _loadFavorites() async {
    final userData = ref.watch(newUserDataProivder);
    var usermail = userData != null ? userData.email : "f";
    String whereString = 'email = ?';
    List<dynamic> whereArguments = [usermail];
    _favorites = await _database.query("favs",
        columns: ['propid'], where: whereString, whereArgs: whereArguments);
    List<String> ids = [];
    for (var element in _favorites) {
      ids.add(element["propid"]);
    }
    var twolists = await PropertyManagement.getWishlistData(ids);
    deleteRemoveditems(twolists[1]);
    resultWhishlist = twolists[0];
    if (mounted) {
      setState(() {
        ref.read(whishlistProvider.notifier).update((state) => resultWhishlist);
      });
    }
  }

  void deleteRemoveditems(List<String> removedIDs) async {
    String whereString = "`propid` IN (?) and `email`= ?";
    final userData = ref.watch(newUserDataProivder);
    var removedIdsString =
        "${removedIDs.toString().substring(1, removedIDs.toString().length - 1)}";
    print(removedIDs);
    if (userData != null) {
      List<dynamic> whereArguments = [removedIdsString, userData.email];
      try {
        await _database.delete("favs",
            where: whereString, whereArgs: whereArguments);
      } catch (e) {
        print(e);
      }
    } else {}
  }
}
