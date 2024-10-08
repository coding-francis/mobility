import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/app_colors.dart';

class PasswordProvider extends StateNotifier<bool> {
  PasswordProvider() : super(false);

  toggleShowPassword() {
    state = !state;
  }
}

final passwordProvider =
    StateNotifierProvider<PasswordProvider, bool>((ref) => PasswordProvider());

class CustomTextInput extends ConsumerWidget {
  final Function()? onTap;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final String? prefixText;
  final Widget? suffix;
  final String? suffixText;
  final Color? fillColor;
  final bool? filled;
  final double radius;
  final Color? borderColor;
  final String? hint;
  final EdgeInsets? padding;
  final bool secureText;
  final TextInputType? keyboard;
  final bool readOnly;
  final String? label;
  final String? initial;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextCapitalization capitalization;
  final Function()? fieldSubmit;
  final bool expands;

  const CustomTextInput(
      {super.key,
      this.onTap,
      this.controller,
      this.onChanged,
      this.validator,
      this.prefix,
      this.prefixText,
      this.suffix,
      this.suffixText,
      this.fillColor,
      this.filled,
      this.radius = 5,
      this.borderColor,
      this.hint,
      this.padding = const EdgeInsets.all(12),
      this.secureText = false,
      this.keyboard,
      this.readOnly = false,
      this.label,
      this.initial,
      this.inputFormatters,
      this.maxLength,
      this.maxLines,
      this.capitalization = TextCapitalization.none,
      this.fieldSubmit,
      this.expands = false,
      this.minLines});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    bool showPassword = ref.watch(passwordProvider);
    final passwordNotifier = ref.read(passwordProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? const SizedBox()
            : Text(
                label!,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
        SizedBox(height: label == null ? 0 : 5),
        TextFormField(
          textInputAction: TextInputAction.done,
          initialValue: initial,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: capitalization,
          onEditingComplete: fieldSubmit,
          onTap: onTap,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: secureText ? !showPassword : false,
          keyboardType: keyboard,
          readOnly: readOnly,
          maxLength: maxLength,
          maxLines: secureText == true ? 1 : maxLines,
          minLines: minLines,
          expands: expands,
          inputFormatters: inputFormatters,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            contentPadding: padding,
            hintText: hint,
            prefixIcon: prefix,
            prefixText: prefixText,
            suffixText: suffixText,
            suffixIcon: secureText == true
                ? IconButton(
                    onPressed: () {
                      passwordNotifier.toggleShowPassword();
                    },
                    icon: Icon(
                      showPassword
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  )
                : suffix,
            fillColor: fillColor,
            filled: filled,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: AppColors.defaultColor, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ],
    );
  }
}
