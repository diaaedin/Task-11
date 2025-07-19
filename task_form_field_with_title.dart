



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskFormFieldWithTitle extends StatelessWidget {

  final String title, hint;
  final int maxlines;
  final Icon? suffix;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  const TaskFormFieldWithTitle({super.key, required this.title, required this.hint,
    this.maxlines=1, this.suffix, this.validator, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(
      fontSize: 18.sp,   fontWeight: FontWeight.bold)),
        SizedBox(height: 10.h),
        TextFormField(
          cursorColor: Color(0XFF4E5AE8),
          keyboardType: TextInputType.text,
          maxLines: maxlines,
          validator: validator,
          onTap: onTap,
          readOnly: onTap!=null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF4E5AE8)),
                borderRadius: BorderRadius.circular(12.r)
            ),
            hintStyle: TextStyle(
              fontSize: 18.sp,
            ),

            hintText:hint,

            suffixIcon: suffix,
          ),
        )
      ],
    );
  }
}
