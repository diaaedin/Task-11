



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project0/feature/home/app_bar/date_task_header.dart';
import 'package:project0/feature/home/app_bar/home_app_bar.dart';
import 'package:project0/feature/home/app_bar/task_filter_date.dart';
import 'package:project0/feature/home/app_bar/task_required.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              HomeAppBar(),
              SizedBox(height: 20.h),
              DateTaskHeader(),
              SizedBox(height: 20.h),
              TaskFilterDate(),
              SizedBox(height: 20.h),
              TaskRequired()
            ],
          ),
        ),
      ),
    );
  }
}
