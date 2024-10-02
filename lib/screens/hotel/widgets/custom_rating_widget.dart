import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelt/screens/hotel/manger/rating_cubit/rating_cubit.dart';

class CustomRatingWidget extends StatelessWidget {
   const CustomRatingWidget({super.key, required this.controller, required this.initialRating});

  final TextEditingController controller;
  final double initialRating;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingCubit(),
      child: BlocBuilder<RatingCubit, RatingState>(
        builder: (context, state) {
          return RatingBar.builder(
            // initialRating: RatingCubit.get(context).rating!,
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
                RatingCubit.get(context).changeRating(rating);
                controller.text = rating.toString();
            },
          );
        },
      ),
    );
  }
}
