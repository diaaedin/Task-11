import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;
  String? _networkImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromInternet() async {
    String imageUrl = "https://picsum.photos/200";
    setState(() {
      _imageFile = null;
      _networkImage = imageUrl;
    });
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _networkImage = null;
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _networkImage = null;
      });
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0XFF4E5AE8),
                borderRadius: BorderRadius.circular(12.r)
            ),
              child: ListTile(

                title: Center(
                  child: Text('Upload from Camera',
                  style: TextStyle( color: Colors.white),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromCamera();
                },
              ),
            ),
            SizedBox(height: 5.sp),
            Container(
              decoration: BoxDecoration(
                color: Color(0XFF4E5AE8),
                borderRadius: BorderRadius.circular(12.r)
              ),
              child: ListTile(
                title: Center(
                  child: Text('Upload from Gallery',
                      style: TextStyle( color: Colors.white)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.light_mode),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : (_networkImage != null
                        ? NetworkImage(_networkImage!)
                        : NetworkImage("https://picsum.photos/200"))
                    as ImageProvider,
                  ),
                  InkWell(
                    onTap: _showImagePickerOptions,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Color(0XFF4E5AE8),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Divider(
              color: Color(0XFF4E5AE8),
              indent: 40.w,
              endIndent: 40.w,
            ),
            SizedBox(height: 40.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Deyaa Eldeen",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0XFF4E5AE8),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 30.r,
                    child: Icon(Icons.mode_edit_outlined,
                        size: 40, color: Color(0XFF4E5AE8)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
