




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project0/feature/home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState (){
    Future.delayed(Duration(seconds:3),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()),
          (r)=>false
      );
    });
  }
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash.gif"),
            SizedBox(height: 20.h),
            Text("My Tasks", style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 30.h),
            Text("It's Time To Organized.",
            style: TextStyle( fontSize: 18.sp),
            ),
          ],
        ),
      ),


    );
  }
}


