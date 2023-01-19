import 'dart:async';
import 'dart:io';
import 'package:aman_project/data/repositories/image_provider.dart';
import 'package:aman_project/models/property.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageManagement {
  final ImagePicker _picker = ImagePicker();
  final ImagePicker _pickerMutli = ImagePicker();
  File? myImage;
  File? compressedImage;
  String? singleImageURl;
  //
  File? myImageMulti;
  File? compressedImageMulti;
  List<File?> compressedImages = [];
  List<String> downloadUrls = [];

  clearImageProivders(WidgetRef ref) {
    compressedImage = null;
    ref.read(imageFileProivder.notifier).state = null;
    compressedImages.clear();
    ref.read(imagesListFileProivder.notifier).state.clear();
  }

  getImage(WidgetRef ref, ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      myImage = File(image.path);
      compressedImage = await FlutterImageCompress.compressAndGetFile(
          myImage!.absolute.path, '${myImage!.path}Compressed.jpg',
          quality: 50);
      ref.read(imageFileProivder.notifier).state = compressedImage;
      Get.back();
    }
  }

  Future uploadFile() async {
    final file = compressedImage!;
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);
    //B2AKED
    singleImageURl = await (await uploadTask).ref.getDownloadURL();
    uploadTask.snapshotEvents.listen((event) async {
      switch (event.state) {
        case TaskState.running:
          final progress = 100.0 * (event.bytesTransferred / event.totalBytes);
          print("Upload is $progress% complete.");
          break;
        case TaskState.success:
          await ref.getDownloadURL().then((value) {
            singleImageURl = value;
          });
          break;
        case TaskState.paused:
          // TODO: Handle this case.
          break;
        case TaskState.canceled:
          // TODO: Handle this case.
          break;
        case TaskState.error:
          // TODO: Handle this case.
          break;
      }
    });
  }
  //Multi Images

  getMultipImage(WidgetRef ref) async {
    List<File?> compressedConnectImages = [];
    ref.read(imagesListFileProivder.notifier).state.clear();
    compressedImages.clear();
    compressedConnectImages.clear();
    final List<XFile>? pickedImages = await _pickerMutli.pickMultiImage();
    if (pickedImages != null) {
      compressedImages =
          await compressProvider(pickedImages, compressedConnectImages);
      ref.read(imagesListFileProivder.notifier).state = compressedImages;
    }
  }

  Future<List<File?>> compressProvider(
      List<XFile> pickedImages, List<File?> imagList) async {
    int counter = 0;
    await Future.forEach(pickedImages, (e) async {
      if (counter++ < 20) {
        myImageMulti = File(e.path);
        compressedImageMulti = await FlutterImageCompress.compressAndGetFile(
            myImageMulti!.absolute.path, '${myImageMulti!.path}Compressed.jpg',
            quality: 50);
        imagList.add(compressedImageMulti);
      }
    });
    return imagList;
  }

  Future uploadMultipleImages() async {
    for (int i = 0; i < compressedImages.length; i++) {
      String url = await uploadMultipleFiles(compressedImages[i]!);
      downloadUrls.add(url);
    }
  }

  Future<String> uploadMultipleFiles(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  ////////////EditImages/////////////////
  Future<String> editUploadFile(Property routeArgs) async {
    String result = routeArgs.singleImage;
    if (compressedImage != null) {
      final file = compressedImage!;
      final metaData = SettableMetadata(contentType: 'image/jpeg');
      final storageRef = FirebaseStorage.instance.ref();

      Reference ref = storageRef
          .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
      await ref.putFile(file, metaData).then((p0) async {
        switch (p0.state) {
          case TaskState.running:
            // print("File is uploading");
            break;
          case TaskState.success:
            await ref.getDownloadURL().then((value) {
              // print("value $value");
              result = value;
            });
            break;
          case TaskState.paused:
            // TODO: Handle this case.
            break;
          case TaskState.canceled:
            // TODO: Handle this case.
            break;
          case TaskState.error:
            // TODO: Handle this case.
            break;
        }
      });

      return result;
    } else {
      return routeArgs.singleImage;
    }
  }

  Future<List<dynamic>> editUploadMutilbeImages(Property routeArgs) async {
    for (int i = 0; i < compressedImages.length; i++) {
      await editUploadMutibleFiles(compressedImages[i]!).then((value) async {
        downloadUrls.add(value);
      });
    }
    if (compressedImages.isEmpty) {
      return routeArgs.multiImages;
    } else {
      return downloadUrls;
    }
  }

  Future<String> editUploadMutibleFiles(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}

class ImageManagementWidget {
  openBottomSheet(WidgetRef ref, ImageManagement imageManagement) {
    Get.bottomSheet(Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      ),
      width: double.infinity,
      height: 150,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        buildImageWidget(
            iconData: Icons.camera_alt,
            onPressed: () {
              // getImage(ImageSource.camera);
              imageManagement.getImage(ref, ImageSource.camera);
            }),
        buildImageWidget(
            iconData: Icons.image,
            onPressed: () {
              // getImage(ImageSource.gallery);
              imageManagement.getImage(ref, ImageSource.gallery);
            }),
      ]),
    ));
  }

  buildImageWidget({required IconData iconData, required Function onPressed}) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            color: Colors.black,
            iconData,
            size: 30,
          ),
        ),
      ),
    );
  }
}
