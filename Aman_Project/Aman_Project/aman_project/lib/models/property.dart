import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../presentation/properties/dropdown.dart';
import '../presentation/shared_features/custom_text_field.dart';

class Property {
  String docId;
  String addressAdmin;
  String addressUser;
  int area;
  // String code;
  String descriptionAdmin;
  String descriptionUser;
  String unitName;
  String offered;
  String ownerName;
  String ownerNumber;
  String paymentMethod;
  String priority;
  String type;
  String visible;
  int price;
  List<dynamic> multiImages;
  String singleImage;
  //UnCommon
  String? doublex;
  String? finishing;
  String? floor;
  String? furnished;
  String? noBarthrooms;
  String? noFlats;
  String? noFloors;
  String? noRooms;
  String? theNumberOFAB;
  String? typeOFActivity;
  Property(
      {required this.docId,
      required this.addressAdmin,
      required this.addressUser,
      required this.area,
      required this.descriptionAdmin,
      required this.descriptionUser,
      required this.unitName,
      required this.offered,
      required this.ownerName,
      required this.ownerNumber,
      required this.paymentMethod,
      required this.priority,
      required this.type,
      required this.visible,
      required this.price,
      required this.multiImages,
      required this.singleImage,
      this.doublex,
      this.finishing,
      this.floor,
      this.furnished,
      this.noBarthrooms,
      this.noFlats,
      this.noFloors,
      this.noRooms,
      this.theNumberOFAB,
      this.typeOFActivity});

  static Padding buildTextField(
      {required String labelText,
      required String hintText,
      required TextEditingController controller,
      required String type,
      bool? show}) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
      child: type == 'number' || type == 'phone'
          ? show == false
              ? const SizedBox()
              : CustomTextField(
                  controller: controller,
                  obscureText: false,
                  labelText: labelText,
                  hintText: hintText,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9]*$"),
                    )
                  ],
                  validator: (value) {
                    if (type == 'number') {
                      if (!value!.isValidNumber) {
                        return 'Please enter a valid $labelText';
                      }
                      return null;
                    }
                    if (type == 'phone') {
                      if (!value!.isValidPhone) {
                        return 'Please enter a valid $labelText';
                      }
                      return null;
                    }
                    return null;
                  },
                )
          : show == false
              ? const SizedBox()
              : CustomTextField(
                  controller: controller,
                  obscureText: false,
                  labelText: labelText,
                  hintText: hintText,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z0-9]+|\s"),
                    )
                  ],
                  validator: (value) {
                    if (type == 'name') {
                      //I hcange from valid name to valid ADDRESS
                      if (!value!.isValidAddress) {
                        return 'Please enter a valid $labelText';
                      }
                      return null;
                    }
                    if (type == 'address') {
                      if (!value!.isValidAddress) {
                        return 'Please enter a valid $labelText';
                      }
                      return null;
                    }
                    return null;
                  },
                ),
    );
  }

  static Widget showDropdown({
    required String text,
    required List<String> dropdownItems,
    required String hint,
    String? value,
    bool? show,
    Function(String?)? onChanged,
  }) {
    return show == false
        ? const SizedBox()
        : Padding(
            padding:
                const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text),
                CustomDropdownButton2(
                  dropdownItems: dropdownItems,
                  hint: hint,
                  value: value,
                  onChanged: onChanged,
                  validatior: (value) {
                    if (value == null) {
                      return 'Please Select';
                    }
                    return null;
                  },
                ),
              ],
            ),
          );
  }
}
