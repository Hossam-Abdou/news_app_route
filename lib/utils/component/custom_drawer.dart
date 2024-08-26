import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app_route/home/view/category_screen.dart';
import 'package:new_app_route/utils/app_colors/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.sizeOf(context).height * 0.3,
            width: double.infinity,
            color: AppColors.primaryColor,
            child: Text(
              'News App!',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          TextButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  CategoryScreen.routeName,
                );
              },
              icon: const Icon(
                Icons.menu_sharp,
                color: Colors.black,
              ),
              label: Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: Text(
                'Settings',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }
}
