import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app_route/home/view_model/home_cubit.dart';
import 'package:new_app_route/utils/app_colors/app_colors.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var article = cubit.everythingModel?.articles?[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: CachedNetworkImage(
                        imageUrl: article?.urlToImage ?? "",
                        placeholder: (context, url) =>
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        fit: BoxFit.cover,
                        height: 200.h,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            article?.author ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            article?.title ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: AppColors.titleColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            textAlign: TextAlign.end,
                            article?.publishedAt?.substring(0, 10) ?? '',
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: 10.h),
            itemCount: cubit.everythingModel?.articles?.length ?? 0,
          ),
        );
      },
    );
  }
}
