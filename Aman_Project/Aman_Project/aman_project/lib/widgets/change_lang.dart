import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void buildLanguageDialog(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', 'ENGLISH');

  // final String? us = prefs.getString('US');
  // final String? eg = prefs.getString('EG');
  // final String? en = prefs.getString('en');
  // final String? ar = prefs.getString('ar');
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'العربيه', 'locale': Locale('ar', 'EG')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text('Choose Your Language'),
          content: Container(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(locale[index]['name']),
                      onTap: () async {
                        final String? name = prefs.getString('name');

                        if (name == 'ENGLISH') {
                          await prefs.setString('us', 'US');
                          await prefs.setString('en', 'en');
                          updateLanguage(locale[index]['locale']);
                        } else {
                          await prefs.setString('eg', 'EG');
                          await prefs.setString('ar', 'ar');
                          updateLanguage(locale[index]['locale']);
                        }
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: locale.length),
          ),
        );
      });
}
