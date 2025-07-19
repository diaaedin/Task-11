



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project0/add_task/task_form_field/color_add_task.dart';
import 'package:project0/add_task/task_form_field/task_form_field_with_title.dart';

class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({super.key});
 var validationKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Color(0XFF4E5AE8),
        ),
        title: Text("Add Task", style: TextStyle(
          fontSize: 22.sp,   fontWeight: FontWeight.bold,
          color: Color(0XFF4E5AE8),
        ),),
      ),
      body: Padding(

        padding: EdgeInsets.symmetric( horizontal: 16.w),
        child: Form(
          key: validationKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskFormFieldWithTitle(
                  title: 'Title',
                  hint: 'Enter title',
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "title is required";
                    }
                  },
                ),
            
                TaskFormFieldWithTitle(
                  title: 'Description',
                  hint: 'Enter description',
                  maxlines: 4,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "title is required";
                    }
                  },
                ),
            
                TaskFormFieldWithTitle(title: 'Date',
                  hint: '2025-7-17',
                    suffix: Icon(Icons.date_range),
                  onTap: (){
                  showDatePicker(context: context, firstDate: DateTime.now(), lastDate:DateTime(2030));
                  },
                ),
                  Row(
                    children: [
                      Expanded(
                        child: TaskFormFieldWithTitle(title: 'Start Time', hint: '09:08',
                          suffix: Icon(Icons.access_time_rounded),
                          onTap: (){
                          showTimePicker(context: context, initialTime: TimeOfDay.now());
                          },
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: TaskFormFieldWithTitle(title: 'End Time', hint: '09:38',
                          suffix: Icon(Icons.access_time_rounded),
                          onTap: (){
                          showTimePicker(context: context, initialTime: TimeOfDay.now());
                          },
                        ),
                      )
                    ],
                  ),
                ColorAddTask()
              ],
            ),
          ),

        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF4E5AE8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r)
            )
          ),

          onPressed: () {
               validationKey.currentState?.validate();
          },
          child: Text("Create Task",
          style: TextStyle(
          fontSize: 18,    fontWeight: FontWeight.bold,
          color: Colors.white
         ),
        ),
        ),
      ),
    );
  }
}
