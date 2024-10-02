import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/shared/styles/themes.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int themeIndex = 0 ;
  int loadingCounter = 0;
  void changeTheme(int themeIndex){

    emit(LoadingChangeThemeState());
    setTheme(themeIndex);
    getDefaultColor();
    getSecondColor();

    loadingCounter++;
    if(loadingCounter >= 2){
      emit(SuccessChangeThemeState());
    }
  }
}
