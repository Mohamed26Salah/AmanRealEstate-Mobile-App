import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),
      body: true
          ? SizedBox(
              height: MediaQuery.of(context).size.height - 10,
              child: ListView.builder(
                  itemCount: resultWhishlist.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(resultWhishlist[index].ownerName),
                    );
                  })),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 210),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset("assets/images/wishlist.png", width: 200),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Your WishList is Empty!',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
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
                          child: Text('Start SHOPPING'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 205, 153, 51),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void _openDatabase() async {
    var databasesPath = await getDatabasesPath();
    String Path = "${databasesPath}favs.db";
    _database = await openDatabase(
      Path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE favs (id INTEGER PRIMARY KEY AUTOINCREMENT, propid TEXT , email TEXT)');
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
    print(_favorites);
    _favorites.forEach((element) {
      ids.add(element["propid"]);
    });
    resultWhishlist = await PropertyManagement.getWishlistData(ids);

    setState(() {});
  }
}
