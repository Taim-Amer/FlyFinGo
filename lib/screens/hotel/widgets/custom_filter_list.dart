import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/hotel/manger/chip_cubit/chip_cubit.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_filter_item.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';

class CustomFilterList extends StatelessWidget {
  CustomFilterList({super.key, required this.cityName, required this.personNumber, required this.start, required this.end, required this.withChildren, this.sort});

  final String cityName;
  final int personNumber;
  final String start;
  final String end;
  final bool withChildren;
  String? sort;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChipCubit, ChipState>(
      builder: (context, state) {
        return CustomStaggeredListAnimation(
          physics: const NeverScrollableScrollPhysics(),
          isHorizontal: true,
          widgetBuilder: (index) {
            String label = ChipCubit.get(context).filterOptions[index];
            return CustomFilterItem(
              label: label,
              isSelected: ChipCubit.get(context).selectedFilter == label,
              onSelected: () {
                ChipCubit.get(context).changeChip(index);
                HotelCubit.get(context).showHotel(
                  cityName: cityName,
                  personNumber: personNumber,
                  start: start,
                  end: end,
                  children: withChildren,
                  sort: label,
                );
              },
            );
          },
          count: ChipCubit.get(context).filterOptions.length,
        );
      },
    );
  }
}
