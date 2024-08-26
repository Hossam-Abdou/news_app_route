import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app_route/home/view_model/home_cubit.dart';
import 'package:new_app_route/utils/app_colors/app_colors.dart';
import 'package:new_app_route/utils/component/custom_drawer.dart';
import 'package:new_app_route/utils/component/news_list_view.dart';
import 'package:new_app_route/utils/component/sources_tab.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String categoryId = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(categoryId),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetNewsLoadingState || state is HomeLoadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetNewsErrorState) {
            Center(
              child: Text(
                "Error loading articles",
                style: GoogleFonts.poppins(
                  color: Colors.redAccent,
                  fontSize: 25,
                ),
              ),
            );
          }
          if (HomeCubit.get(context).everythingModel?.articles?.isEmpty ??
              true) {
            Center(
              child: Text(
                "No articles available",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return DefaultTabController(
            length: cubit.sourcesModel?.sources?.length ?? 0,
            child: Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                // leading:!_isSearching? null :SizedBox.shrink(),
                iconTheme: const IconThemeData(
                  color: AppColors.white,
                ),
                centerTitle: true,
                elevation: 0,
                // actions: [
                //   // IconButton(
                //   //   onPressed: () {
                //   //     setState(() {
                //   //       _isSearching = !_isSearching;
                //   //     });
                //   //   },
                //   //   icon: Icon(
                //   //     _isSearching ? Icons.close : Icons.search,
                //   //     size: 35.sp,
                //   //   ),
                //   // ),
                // ],
                title:   Text(
                  categoryId,
                  style: GoogleFonts.exo(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 22.sp,
                  ),
                ),
                // _isSearching ? TextFormField(
                // //
                // //   decoration: InputDecoration(
                // //     prefixIcon: Icon(Icons.search, color: AppColors.primaryColor,) ,
                // //     suffixIcon: Icon(Icons.close, color: AppColors.primaryColor,),
                // //     contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                // //     fillColor: Colors.white,
                // //     filled: true,
                // //     hintText: 'Email',
                // //     hintStyle: GoogleFonts.poppins(
                // //       fontSize: 14,
                // //       fontWeight: FontWeight.w400,
                // //       color: Color(0xff39A552)
                // //     ),
                // //     border: OutlineInputBorder(
                // //       borderRadius: BorderRadius.circular(30),
                // //       borderSide: BorderSide(
                // //         color: Colors.white,
                // //       ),
                // //     ),
                // //   ),
                // // )
                // //     :

                backgroundColor: AppColors.primaryColor,
                shape: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.r),
                child: const Column(
                  children: [
                     SourcesTab(),
                    NewsListView(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
