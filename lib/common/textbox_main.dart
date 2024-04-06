import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ionicons/ionicons.dart';

class TextBox extends StatelessWidget {
  TextBox(
      {super.key,
      required this.fieldName,
      this.title,
      this.hint,
      this.validator,
      this.inputType,
      this.isRTL = false,
      this.isPasswordField = false,
      this.isFieldDense = false,
      this.controller,
      this.initialValue,
      this.onChanged});

  final String fieldName;
  final String? title;
  final String? hint;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final bool isRTL;
  final bool isPasswordField;
  final bool isFieldDense;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? initialValue;

// local state
  final ValueNotifier<bool> _isTextHidden = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            title!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 8),
        Directionality(
          textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: ValueListenableBuilder<bool>(
            valueListenable: _isTextHidden,
            builder: (context, isHidden, _) {
              return FormBuilderTextField(
                name: fieldName,
                initialValue: initialValue,
                validator: validator,
                controller: controller,
                onChanged: onChanged,
                keyboardType: inputType,
                obscureText: isPasswordField && isHidden,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: hint ?? title,
                  isDense: isFieldDense,
                  suffixIcon:
                      isPasswordField ? _buildVisibilityButton(isHidden) : null,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).hintColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    // borderSide: BorderSide()
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _buildVisibilityButton(bool isHidden) {
    return IconButton(
      icon: Icon(
        isHidden ? Ionicons.eye_outline : Ionicons.eye_off_outline,
        size: 24,
      ),
      splashRadius: 20,
      onPressed: () {
        _isTextHidden.value = !isHidden;
      },
    );
  }
}
