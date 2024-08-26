import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app_route/home/view_model/home_cubit.dart';
import 'package:new_app_route/utils/app_colors/app_colors.dart';

class SourcesTab extends StatelessWidget {
  const SourcesTab({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return TabBar(
          splashFactory: NoSplash.splashFactory,
          indicatorColor: Colors.transparent,
          labelColor: AppColors.primaryColor,
          dividerColor: Colors.transparent,
          isScrollable: true,
          labelPadding: EdgeInsets.all(8.r),
          padding: EdgeInsets.zero,
          onTap: (index) {
            cubit.changeContainerColor(index);
            cubit.getEverything(
                cubit.sourcesModel?.sources?[index].id ?? '');
          },
          tabs: cubit.sourcesModel?.sources?.map((source) {
            int index =
            cubit.sourcesModel!.sources!.indexOf(source);
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: cubit.currentIndex == index
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(25.r),
                border: Border.all(
                    color: AppColors.primaryColor, width: 2),
              ),
              child: Text(
                source.name ?? "",
                style: GoogleFonts.exo(
                  color: cubit.currentIndex == index
                      ? AppColors.white
                      : AppColors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList() ??
              [],
        );
      },
    );
  }
}
