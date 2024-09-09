import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_route/home/model/source_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_app_route/home/model/everythig_model.dart';
import 'package:new_app_route/utils/end_points/end_points.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  SourcesModel? sourcesModel;
  EverythingModel? everythingModel;

  int currentIndex = 0;

  void changeContainerColor(int index) {
    currentIndex = index;
    emit(ChangeContainerColorState());
  }

  void getSources(id) async {
    emit(HomeLoadingState());
    Uri uri = Uri.https('newsapi.org', '/v2/top-headlines/sources',
        {'apiKey': 'a8da8a6e02e14948a25ac8c8cdc9ef44', "category": id});
    http.get(uri).then((value) {
      debugPrint('Response status: ${value.statusCode}');
      debugPrint('Response body: ${value.body}');
      sourcesModel = SourcesModel.fromJson(
        jsonDecode(value.body),
      );
      emit(HomeSuccessState());

      getEverything(source:sourcesModel!.sources![currentIndex].id ?? '');
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(HomeErrorState());
    });
  }

  void getEverything({String? query,String? source}) {
    emit(GetNewsLoadingState());
    Map<String, String> queryParams = {
      'apiKey': 'a8da8a6e02e14948a25ac8c8cdc9ef44',
    };

    if (query != null && query.isNotEmpty) {
      queryParams['q'] = query;
    }
    if (source != null && source.isNotEmpty) {
      queryParams['sources'] = source;
    }
    Uri uri = Uri.https(
      EndPoints.baseUrl,
      EndPoints.everything,
      queryParams,
    );
    if (query != null && query.isNotEmpty) {
      queryParams['q'] = query;
    }
    http.get(uri).then((value) {
      debugPrint('Response status: ${value.statusCode}');
      debugPrint('Response body: ${value.body}');
      everythingModel = EverythingModel.fromJson(jsonDecode(value.body));
      emit(GetNewsSuccessState());
    }).catchError((error) {
      debugPrint('Error: $error');
      emit(GetNewsErrorState());
    });
  }
}
