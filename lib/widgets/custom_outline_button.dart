import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final double? radius;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? textColor;
  final double? borderWidth;
  final bool fullWidth;

  const CustomOutlineButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.radius,
    this.height,
    this.width,
    this.borderColor,
    this.textColor,
    this.borderWidth,
    this.fullWidth = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: fullWidth ? width ?? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            color: textColor ?? AppColors.defaultColor,
            fontFamily: 'Manrope',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 5),
            side: BorderSide(
              color: borderColor ?? AppColors.defaultColor,
              width: borderWidth ?? 1,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
