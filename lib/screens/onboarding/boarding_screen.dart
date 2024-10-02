import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelt/models/boarding_model.dart';
import 'package:travelt/screens/login/login_page.dart';
import 'package:travelt/screens/onboarding/cubit/boarding_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/screens/onboarding/widgets/custom_boarding_item.dart';
import 'package:travelt/widgets/custom_floating_action.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/text_button_item.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var boardController = PageController();

    return BlocProvider(
        create: (context) => BoardingCubit(),
        child: BlocConsumer<BoardingCubit , BoardingState>(
          listener: (context , state){},
          builder: (context , state){
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      secondColor,
                      wightGreyColor,
                      textColor,
                    ]
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  actions:
                  [
                    // defaultTextButton(
                    //   function: (){
                    //     BoardingCubit.get(context).submit();
                    //     navigateAndFinish(context, LoginPage());
                    //   },
                    //   text: "SKIP",
                    // )
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children:
                    [
                      Expanded(
                        child: PageView.builder(
                          controller: boardController,
                          itemBuilder: (context , index) => CustomBoardingItem(boardingModel: BoardingCubit.get(context).boarding[index]),
                          onPageChanged: (index){
                            if(index == BoardingCubit.get(context).boarding.length - 1){
                              BoardingCubit.get(context).isLast = true;
                              print('Last');
                            }else{
                              BoardingCubit.get(context).isLast = false;
                              print('Not Last');
                            }
                          },
                          itemCount: BoardingCubit.get(context).boarding.length,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children:
                        [
                          SmoothPageIndicator(
                              controller: boardController,
                              effect: ExpandingDotsEffect(
                                dotColor: wightGreyColor,
                                activeDotColor: defaultColor,
                                dotHeight: 10,
                                expansionFactor: 4,
                                dotWidth: 10,
                                spacing: 5,
                              ),
                              count: 3
                          ),
                          const Spacer(),
                          CustomFloatingAction(
                              color1: secondColor,
                              color2: defaultColor ,
                              function: (){
                                if(BoardingCubit.get(context).isLast){
                                  BoardingCubit.get(context).submit();
                                  navigateAndFinish(context, LoginPage());
                                }else{
                                  boardController.nextPage(
                                    duration: const Duration(
                                      microseconds: 1000,
                                    ),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                  );
                                }
                              }
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}
