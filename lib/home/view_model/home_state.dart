part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class ChangeContainerColorState extends HomeState {}

final class HomeLoadingState extends HomeState {}
final class HomeSuccessState extends HomeState {}
final class HomeErrorState extends HomeState {}

final class GetNewsLoadingState extends HomeState {}
final class GetNewsSuccessState extends HomeState {}
final class GetNewsErrorState extends HomeState {}
