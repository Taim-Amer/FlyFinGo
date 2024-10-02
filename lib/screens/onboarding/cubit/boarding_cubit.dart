
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/boarding_model.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:meta/meta.dart';
part 'boarding_state.dart';


class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingInitial());

  static BoardingCubit get(context) => BlocProvider.of(context);
  bool isLast = false;

  List<BoardingModel> boarding =
  [
    BoardingModel("title 1", "assets/images/bird.png", "body 1"),
    BoardingModel("title 2", "assets/images/bird.png", "body 2"),
    BoardingModel("title 3", "assets/images/bird.png", "body 3"),
  ];

  void submit()
  {
    CacheHelper.saveData(
        key: "onBoarding",
        value: true
    ).then((value){
      emit(OnBoardingSuccessState());
    });
  }
}
