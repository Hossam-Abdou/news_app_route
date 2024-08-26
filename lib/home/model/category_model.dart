import 'package:flutter/material.dart';
import 'package:new_app_route/utils/app_colors/app_colors.dart';
import 'package:new_app_route/utils/app_images/app_images.dart';

class CategoryModel {
  String title;
  String image;
  String id;
  Color color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.color,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: 'sports',
        title: 'Sports',
        image: AppImages.sports,
        color: AppColors.sportsColor,
      ),
      CategoryModel(
        id: 'general',
        title: 'General',
        image: AppImages.general,
        color: AppColors.generalColor,
      ),
      CategoryModel(
        id: 'health',
        title: 'Health',
        image: AppImages.health,
        color: AppColors.healthColor,
      ),
      CategoryModel(
        id: 'business',
        title: 'Business',
        image: AppImages.business,
        color: AppColors.businessColor,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        image: AppImages.entertainment,
        color: AppColors.entertainmentColor,
      ),
      CategoryModel(
        id: 'science',
        title: 'Science',
        image: AppImages.science,
        color: AppColors.scienceColor,
      ),
    ];
  }
}
