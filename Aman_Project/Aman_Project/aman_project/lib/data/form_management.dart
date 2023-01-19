import 'package:aman_project/presentation/shared_features/custom_decoration.dart';
import 'package:aman_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormManagement {
  static Padding buildTextField(
      {required String labelText,
      required String hintText,
      required TextEditingController controller,
      required String type,
      bool? show,
      BuildContext? context}) {
    var contextTextColor =
        context == null ? blackColor : Theme.of(context).backgroundColor;
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
      child: type == 'number' || type == 'phone'
          ? show == false
              ? const SizedBox()
              : TextFormField(
                  style: TextStyle(
                    color: contextTextColor,
                  ),
                  controller: controller,
                  obscureText: false,
                  decoration: CommonStyle.textFieldStyle(
                      labelText: labelText,
                      hintText: hintText,
                      context: context),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                    FilteringTextInputFormatter.allow(
                      RegExp("^[0-9]*"),
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
              : TextFormField(
                  style: TextStyle(
                    color: contextTextColor,
                  ),
                  controller: controller,
                  obscureText: false,
                  decoration: CommonStyle.textFieldStyle(
                      labelText: labelText,
                      hintText: hintText,
                      context: context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      // RegExp(r"[a-zA-Z0-9]+|\s"),
                      RegExp(
                          "^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z ]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z0-9-_ \\.]*"),
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
    required BuildContext context,
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
                DropdownButtonFormField(
                  //To avoid long text overflowing.
                  style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                  ),
                  isExpanded: true,
                  hint: Text(
                    hint,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  value: value,
                  items: dropdownItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: onChanged,
                  //French accent
                  validator: (value) {
                    if (value == null) {
                      return 'Please Select';
                    }
                    return null;
                  },

                  borderRadius: BorderRadius.circular(12),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 205, 153, 51),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 205, 153, 51), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                  ),
                ),
              ],
            ),
          );
  }
}
