import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app_route/home/model/everythig_model.dart';
import 'package:new_app_route/utils/app_colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class NewDetails extends StatelessWidget {
  static const String routeName = 'news_details';

  const NewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      article.author ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      article.title ?? 'Deleted Title',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      textAlign: TextAlign.end,
                      article.publishedAt?.substring(0, 10) ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      article.description ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Uri uri = Uri.parse(article.url ??
                                'https://img.freepik.com/free-vector/404-error-with-person-looking-concept-illustration_114360-7932.jpg');
                            launchUrl(uri);
                          },
                          child: Text(
                            'View Full Article',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
