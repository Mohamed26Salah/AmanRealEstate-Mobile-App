import 'package:aman_project/data/user_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void buildLanguageDialog(BuildContext context) async {
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
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(locale[index]['name']),
                      onTap: () {
                        UserHelper().saveLangPref(index);
                        updateLanguage(locale[index]['locale']);
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
