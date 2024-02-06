import 'package:dairy_calculator/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class TextformFieldWidget extends StatefulWidget {
  const TextformFieldWidget({
    super.key,
    this.formKey,
    this.hintText,
    this.height,
    this.rouneded = 5.0,
    this.fontWeight,
    this.focusNode,
    this.suffixIcon,
    this.isSuffixIconShow = false,
    this.isRounded = true,
    this.backgroundColor,
    this.controller,
    this.errorTextColor,
    this.textInputType,
    this.inputFormater,
    this.errorTextSize,
    this.onChanged,
    this.validator,
    this.isEnable = true,
    this.initialValue,
    this.isBorderColor = true,
    this.obscureText,
    this.readOnly = false,
    this.hintTextColor,
    this.textColor,
    this.fontSize,
    this.maxLine,
    this.onOutSideTap,
    this.autovalidateMode,
  });

  final GlobalKey<FormState>? formKey;
  final String? initialValue;
  final String? hintText;
  final int? maxLine;
  final bool isSuffixIconShow;
  final double? height;
  final double rouneded;
  final bool isRounded;
  final double? fontSize;
  final double? errorTextSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? errorTextColor;
  final Color? hintTextColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormater;
  final bool? isBorderColor;
  final bool? obscureText;
  final bool? isEnable;
  final bool readOnly;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(PointerDownEvent)? onOutSideTap;
  final AutovalidateMode? autovalidateMode;
  @override
  State<TextformFieldWidget> createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius:
            widget.isRounded ? BorderRadius.circular(widget.rouneded) : null,
      ),
      height: widget.height,
      child: Form(
        key: widget.formKey,
        autovalidateMode:widget.autovalidateMode,
        child: TextFormField(
            maxLines: widget.maxLine ?? 1,
            obscureText: widget.obscureText ?? false,
            initialValue: widget.initialValue,
            cursorColor:AppColors.backgroundDark,
            inputFormatters: widget.inputFormater,
            onTapOutside: widget.onOutSideTap,
            keyboardType: widget.textInputType,
            autofocus: true,
            readOnly: widget.readOnly,
            enabled: widget.isEnable,
            controller: widget.controller,
            focusNode: widget.focusNode,
            onChanged: widget.onChanged,
            validator: widget.validator,
            style: GoogleFonts.kumbhSans(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: widget.textColor),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.h),
                hintText: widget.hintText,
                suffixIcon: widget.suffixIcon,
                hintStyle: GoogleFonts.kumbhSans(
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                    color: widget.hintTextColor),
                errorStyle: GoogleFonts.kumbhSans(
                    // Use the errorTextColor property for error text color
                    color: widget.errorTextColor ?? Colors.red,
                    fontSize: widget.errorTextSize ?? 13.sp),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.rouneded),
                    borderSide: BorderSide(
                        width: 1.w,
                        color: (widget.isBorderColor ?? false)
                            ? AppColors.borderColor
                            : AppColors.backgroundDark)),
                focusedBorder: widget.isRounded
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.rouneded),
                        borderSide: BorderSide(
                            width: 1.w,
                            color: (widget.isBorderColor ?? false)
                                ? AppColors.borderColor
                                : AppColors.backgroundDark))
                    : null,
                border: widget.isRounded
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.rouneded),
                        borderSide: BorderSide(
                            width: 1.w,
                            color: (widget.isBorderColor ?? false)
                                ? AppColors.borderColor
                                : AppColors.borderColor))
                    : null)),
      ),
    );
  }
}
