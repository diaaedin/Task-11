//
//
//
//
// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class TaskFilterDate extends StatefulWidget {
//   const TaskFilterDate({super.key});
//
//   @override
//   State<TaskFilterDate> createState() => _TaskFilterDateState();
// }
//
// class _TaskFilterDateState extends State<TaskFilterDate> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         children: [
//           TaskFilterItem(
//             isActive : true,
//             month: 'OCT',
//             number: '30',
//             day: 'MON',
//           ),
//           SizedBox(width: 5.w),
//           TaskFilterItem(
//             month: 'OCT',
//             number: '31',
//             day: 'TUS'),
//           SizedBox(width: 5.w),
//           TaskFilterItem(
//             month: 'NOV',
//             number: '1',
//             day: 'WED'),
//           SizedBox(width: 5.w),
//           TaskFilterItem(
//             month: 'NOV',
//             number: '2',
//             day: 'THU')
//         ],
//     );
//   }
// }
//
// class TaskFilterItem extends StatelessWidget {
//   final bool isActive;
//   final String month, number, day;
//   const TaskFilterItem({super.key, this.isActive= false, required this.month, required this.number, required this.day});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 20.w,        vertical: 15.h
//         ),
//         decoration: BoxDecoration(
//           color:isActive? Color(0XFF4E5AE8): Colors.white,
//           borderRadius: BorderRadius.circular(12.r)
//         ),
//         child: Column(
//           children: [
//             Text(month, style: TextStyle(
//               fontSize: 15.sp,   color: isActive?Colors.white:Colors.black
//             ),),
//             SizedBox(height: 5.h),
//             Text(number, style: TextStyle(
//                 fontSize: 15.sp,   color: isActive?Colors.white:Colors.black)),
//             SizedBox(height: 5.h),
//             Text(day, style: TextStyle(
//       fontSize: 15.sp,   color: isActive?Colors.white:Colors.black))
//           ],
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskFilterDate extends StatefulWidget {
  const TaskFilterDate({super.key});

  @override
  State<TaskFilterDate> createState() => _TaskFilterDateState();
}

class _TaskFilterDateState extends State<TaskFilterDate> {
  int activeIndex = 0;

  final List<Map<String, String>> dates = [
    {"month": "OCT", "number": "30", "day": "MON"},
    {"month": "OCT", "number": "31", "day": "TUS"},
    {"month": "NOV", "number": "1", "day": "WED"},
    {"month": "NOV", "number": "2", "day": "THU"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(dates.length, (index) {
          final item = dates[index];
          return SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: TaskFilterItem(
                  isActive: index == activeIndex,
                  month: item['month']!,
                  number: item['number']!,
                  day: item['day']!,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class TaskFilterItem extends StatelessWidget {
  final bool isActive;
  final String month, number, day;

  const TaskFilterItem({
    super.key,
    this.isActive = false,
    required this.month,
    required this.number,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: isActive ? const Color(0XFF4E5AE8) : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(

        children: [
          Text(
            month,
            style: TextStyle(
              fontSize: 15.sp,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            number,
            style: TextStyle(
              fontSize: 15.sp,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            day,
            style: TextStyle(
              fontSize: 15.sp,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
