



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskRequired extends StatefulWidget {
  const TaskRequired({super.key});

  @override
  State<TaskRequired> createState() => _TaskRequiredState();
}

class _TaskRequiredState extends State<TaskRequired> {
  List<int> tasks = List.generate(30, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index)=>SizedBox(height: 5.h),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          const int shadesPerColor = 3;
          final int x = index + 1;
          final baseColors = [
            Colors.black,
            Colors.brown,
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.blue,
            Colors.purple,
            Colors.pink,
            Colors.teal
          ];
          final colorGroupIndex = (index ~/ shadesPerColor) % baseColors.length;
          final shadeIndex = index % shadesPerColor;

          final baseColor = baseColors[colorGroupIndex];
          final t = shadeIndex / (shadesPerColor - 1);
          final adjustedT = 0.3 * t;
          final backgroundColor = Color.lerp(
              baseColor, Colors.white, adjustedT)!;


          return Dismissible(
              key: UniqueKey(),

              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Text("Completed   ", style: TextStyle(
                      fontSize: 18.sp, fontWeight: FontWeight.bold,
                      color: Color(0XFF770077)
                  ),),
                  Icon(Icons.check, color: Colors.white)]),
              ),


              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Expanded(child: Text(" ")),
                  Text("Deleted   ", style: TextStyle(
                      fontSize: 18.sp, fontWeight: FontWeight.bold,
                      color: Color(0XFF007777)
                  ),),
                  Icon(Icons.delete, color: Colors.white)

                ]),
              ),

              onDismissed: (direction) {
                setState(() {
                  tasks.removeAt(index);
                });
                if (direction == DismissDirection.startToEnd) {
                  print('Task Completed');
                } else {
                  print('Task Deleted');
                }
              },

              child: Container(

              padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12.r)
          ),
          child: IntrinsicHeight(
          child: Row(
          children: [
          Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Flutter Task-$x", style: TextStyle(
          fontSize: 22.sp,   fontWeight: FontWeight.bold,
          color: Colors.white,
          ),),
          SizedBox(height: 5.h),
          Row(
          children: [
          Icon(Icons.access_time, color: Colors.white),
          Text("02:25AM-02:40AM", style: TextStyle(
          fontSize: 15.sp,   fontWeight: FontWeight.w300,
          color: Colors.white,))
          ],
          ),
          SizedBox(height: 5.h),
          Text("I Will Do This Task", style: TextStyle(
          fontSize: 18.sp,   fontWeight: FontWeight.w500,
          color: Colors.white))
          ],
          ),
          ),
          VerticalDivider(
          color: Colors.white,
          thickness: 2.w,
          endIndent: 2.h,
          ),
          RotatedBox(
          quarterTurns: 3,
          child: Text("ToDo", style: TextStyle(
          fontSize: 18.sp,   fontWeight: FontWeight.w500,
          color: Colors.white)),
          )
          ],
          ),
          ),
              )
          );
        }
        ),
    );
  }
}



