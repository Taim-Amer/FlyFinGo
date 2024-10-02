part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final ProfileModel profileModel;
  ProfileSuccessState(this.profileModel);
}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);

}
