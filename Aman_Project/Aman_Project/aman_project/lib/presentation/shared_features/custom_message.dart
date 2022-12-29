import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import '../../constants/globals.dart' as val;

void errormessage(String t, String m) {
  val.snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: t,
      message: m,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );
}
//need to be use after the call of the function
// ScaffoldMessenger.of(context)
//                           ..hideCurrentSnackBar()
//                           ..showSnackBar(val.snackBar);

void goodmessage(String t, String m) {
  val.materialBanner = MaterialBanner(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    backgroundColor: Colors.transparent,
    forceActionsBelow: true,
    content: AwesomeSnackbarContent(
      title: t,
      message: m,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.success,
      // to configure for material banner
      inMaterialBanner: true,
    ),
    actions: const [SizedBox.shrink()],
  );
}

void goodMessageSnackBar(String t, String m) {
  val.snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: t,
      message: m,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.success,
    ),
  );
}


//need to be use after the call of the function
//  ScaffoldMessenger.of(context)
//                             ..hideCurrentMaterialBanner()
//                             ..showMaterialBanner(val.materialBanner);