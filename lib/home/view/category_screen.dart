import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app_route/home/model/category_model.dart';
import 'package:new_app_route/home/view/home_screen.dart';
import 'package:new_app_route/home/view_model/home_cubit.dart';
import 'package:new_app_route/utils/app_colors/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = 'categoryScreen';

  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.getCategories();

    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    // var cubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 35.sp,
            ),
          ),
        ],
        title: Text(
          'Categories',
          style: GoogleFonts.exo(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
            fontSize: 22.sp,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.r),
            bottomRight: Radius.circular(50.r),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Pick your category\nof interest',style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                
              ),),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                        
                    return GestureDetector(
                      onTap: () {
                        debugPrint('Category tapped: ${category.title}');
                        Navigator.pushReplacementNamed(context, HomeScreen.routeName,
                          arguments: category.id,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: category.color,
                          borderRadius: BorderRadius.only(
                           topLeft:const Radius.circular(25),
                            topRight: const Radius.circular(25),
                            bottomRight: index.isEven ? const Radius.circular(0):const Radius.circular(20),
                            bottomLeft: index.isOdd ? const Radius.circular(0):const Radius.circular(20),
                        
                        
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              category.image,
                              height: MediaQuery.sizeOf(context).height*0.14,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              category.title,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
