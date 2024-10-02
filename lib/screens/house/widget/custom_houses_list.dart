import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/show_house_model.dart';
import 'package:travelt/screens/house/cubit/house_cubit.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';

import 'custom_house_item.dart';

class CustomHousesList extends StatelessWidget {
  const CustomHousesList({super.key, required this.showHousesModel});

  final ShowHousesModel showHousesModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseCubit, HouseState>(
      builder: (context, state) {
        return CustomStaggeredListAnimation(
          widgetBuilder: (index) => CustomHouseItem(
              id: showHousesModel.data![index].id ?? 0,
              space: showHousesModel.data![index].space ?? 1,
              location: showHousesModel.data![index].location ?? "",
              description: showHousesModel.data![index].description ?? "",
              monthlyRent: showHousesModel.data![index].monthlyRent ?? 0,
              personNum: showHousesModel.data![index].personNum ?? 1,
              rooms: showHousesModel.data![index].rooms ?? 1,
              baths: showHousesModel.data![index].baths ?? 1,
              verificationStatus: showHousesModel.data![index].verificationStatus ?? "",
              isFavorite: showHousesModel.data![index].isFavorite ?? false,
              photoUrl: showHousesModel.data![index].photoUrl ?? "",
          ),
          count: showHousesModel.data!.length,
        );
      },
    );
  }
}
