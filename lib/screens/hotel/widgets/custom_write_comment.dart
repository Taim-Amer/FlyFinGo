import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';

class CustomWriteComment extends StatelessWidget {
  const CustomWriteComment({super.key, required this.commentController, required this.rateController, required this.hotelId});

  final TextEditingController commentController;
  final TextEditingController rateController;
  final String hotelId;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state){
        if(state is HotelAddCommentSuccessState){
          showToast(state.addCommentModel.message!, ToastState.SUCCESS);
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enableInteractiveSelection: false,
                  cursorColor: defaultColor,
                  controller: commentController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondColor)),
                    hintText: 'Write your comment here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.black,),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  onPressed: (){
                    int? id = int.tryParse(hotelId);
                    double? rate = double.tryParse(rateController.text);
                    if(rateController.text.isNotEmpty){
                      HotelCubit.get(context).addComment(
                        comment: commentController.text,
                        rate: rate!,
                        hotelId: id!,
                      );
                      commentController.clear();
                    }else if(rateController.text.isEmpty){
                      HotelCubit.get(context).addComment(
                        comment: commentController.text,
                        rate: 3,
                        hotelId: id!,
                      );
                      commentController.clear();
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: defaultColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Icon(Icons.send,color: secondColor,),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
