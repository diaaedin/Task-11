



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorAddTask extends StatefulWidget {
   const ColorAddTask({super.key});

  @override
  State<ColorAddTask> createState() => _ColorAddTaskState();
}

class _ColorAddTaskState extends State<ColorAddTask> {
  int activeColor = 0;
  List<Color> colors = [
    Colors.blue,  Colors.orange,  Colors.red,  Colors.yellow, Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color", style: TextStyle(
          fontSize: 18.sp,    fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 2.h),
        SizedBox(
               height: 50.h,  width: 225.w,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index)=>ItemColor(
                backgroundColor:colors[index],
              isActive : index == activeColor,
              onTap: () {
                if (activeColor != index) {
                  setState(() {
                    activeColor = index;
                  });
                }},
              ),
              separatorBuilder: (context, index)=>SizedBox(width: 5.w),
              itemCount: colors.length),
        )
      ],
    );
  }
}




class ItemColor extends StatelessWidget {

  final Color? backgroundColor;
  final bool isActive;
  final void Function()? onTap;
  const ItemColor({super.key, this.backgroundColor,
    this.isActive=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor:backgroundColor,
        radius: 20.r,
        child: isActive?Icon(Icons.check, color: Colors.white,):null
      ),
    );
  }
}
