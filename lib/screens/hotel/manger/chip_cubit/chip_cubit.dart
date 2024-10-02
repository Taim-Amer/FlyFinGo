import 'package:flutter_bloc/flutter_bloc.dart';

part 'chip_state.dart';

class ChipCubit extends Cubit<ChipState> {
  ChipCubit() : super(ChipInitial());
  static ChipCubit get(context) => BlocProvider.of(context);

  String selectedFilter = "normal";
  final List<String> filterOptions = ["normal", "popular", "rate", "price"];

  void changeChip(int index) {
    selectedFilter = filterOptions[index];
    emit(ChangeChipState());
  }
}
