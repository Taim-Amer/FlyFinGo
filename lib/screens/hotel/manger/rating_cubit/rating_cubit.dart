import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingInitial());
  static RatingCubit get(context) => BlocProvider.of(context);

  double? rating;

  void changeRating(double rate){
    rating = rate;
    emit(RatingChangeState());
  }
}
