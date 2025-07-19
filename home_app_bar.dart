



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project0/feature/profile/profile_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello, Deyaa", style: TextStyle(
                  fontSize: 18.sp, fontWeight: FontWeight.bold, color: Color(0XFF4E5AE8)
              ),),
              Text("Have A Nice Day.", style: TextStyle(
                  fontSize: 17.sp
              ),)
            ],
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
            child: CircleAvatar(
              radius: 40.r,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1503264116251-35a269479413?auto=format&fit=crop&w=200&q=80"),
            ),
          ),

        ]
    );
  }
}
