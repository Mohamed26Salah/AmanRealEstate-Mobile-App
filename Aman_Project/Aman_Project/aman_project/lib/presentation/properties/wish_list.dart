import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import 'property_widget_card.dart';

class wish_list extends ConsumerStatefulWidget {
  wish_list({Key? key}) : super(key: key);

  @override
  ConsumerState<wish_list> createState() => _wish_listState();
}

class _wish_listState extends ConsumerState<wish_list> {
  late Database _database;
  late List<Map<String, dynamic>> _favorites;
  List<Property> resultWhishlist = [];
  @override
  void initState() {
    _openDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return resultWhishlist.isNotEmpty
        ? SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Your Whishlist",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                    height: 0.9, //line height 90% of actual height
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: ListView.builder(
                      itemCount: resultWhishlist.length,
                      itemBuilder: (context, index) {
                        // ref.read(resultsCount.notifier).state = data.size;
                        return PropertyWidget(
                          property: resultWhishlist[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        : SafeArea(
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
    resultWhishlist = await PropertyManagement.getWishlistData(ids);

    setState(() {});
  }
}
