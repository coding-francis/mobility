import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final double? radius;
  final double? height;
  final double? width;
  final Color? bgColor;
  final Color? textColor;
  final Widget? loader;
  final bool loading;
  final bool fullWidth;
  final bool disabled;

  const CustomFilledButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.radius,
    this.height,
    this.width,
    this.bgColor,
    this.textColor,
    this.loader,
    this.loading = false,
    this.fullWidth = true,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !loading,
      replacement: loader ?? const SizedBox.shrink(),
      child: Opacity(
        opacity: disabled ? 0.5 : 1,
        child: SizedBox(
          height: height ?? 50,
          width: fullWidth ? width ?? double.infinity : null,
          child: ElevatedButton(
            onPressed: disabled ? () {} : onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: bgColor ?? AppColors.defaultColor,
              textStyle: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: 'Raleway',
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 5),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
