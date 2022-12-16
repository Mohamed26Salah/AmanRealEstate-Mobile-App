import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/globals.dart' as glob;

void buildLanguageDialog(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setInt('counter', glob.x);
  // await prefs.setStringList('name', <String>['ENGLISH', 'العربيه']);

  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'العربيه', 'locale': const Locale('ar', 'EG')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: const Text('Choose Your Language'),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  glob.x = index;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(locale[glob.x]['name']),
                      onTap: () {
                        var counter = preferences.getInt('counter');
                        if (counter == 0) {
                          glob.x = 1;
                          updateLanguage(locale[1]['locale']);
                        } else {
                          glob.x = 0;
                          updateLanguage(locale[0]['locale']);
                        }
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: locale.length),
          ),
        );
      });
}
