import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final String? Function(dynamic value) validatior;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    Key? key,
    // required String? Function(dynamic value) validator,
    required this.validatior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      //To avoid long text overflowing.
      isExpanded: true,
      hint: Container(
        alignment: hintAlignment,
        child: Text(
          hint,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: 17,
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
      value: value,
      items: dropdownItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Container(
                  alignment: valueAlignment,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      selectedItemBuilder: selectedItemBuilder,
      icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
      iconSize: iconSize ?? 12,
      iconEnabledColor: iconEnabledColor,
      iconDisabledColor: iconDisabledColor,
      validator: validatior,
      dropdownColor: Colors.grey[200],
      borderRadius: BorderRadius.circular(12),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 205, 153, 51), width: 1)),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 205, 153, 51), width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
