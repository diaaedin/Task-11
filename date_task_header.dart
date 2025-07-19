



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project0/add_task/add_task_screen.dart';

class DateTaskHeader extends StatelessWidget {
  const DateTaskHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("October 30, 2023 \nToday"),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,  vertical: 15.h
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Color(0XFF4E5AE8)
            ),
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                Text("Add Task", style: TextStyle(
                  fontSize: 18.sp,      color: Colors.white
                ),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
