import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/city/cubit/city_cubit.dart';
import 'package:travelt/screens/city/search_result_screen.dart';
import 'package:travelt/screens/drawer/drawer_page.dart';
import 'package:travelt/screens/home/cubit/home_cubit.dart';
import 'package:travelt/shared/cubit/app_cubit.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/screens/home/widgets/custom_carousel_item.dart';
import 'package:travelt/widgets/custom_fade_animated.dart';
import 'package:travelt/screens/home/widgets/custom_home_circlar_widget.dart';
import 'package:travelt/screens/home/widgets/custom_start_button_widget.dart';
import 'package:travelt/widgets/custom_text_field.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/text_items.dart';
import 'package:travelt/screens/home/widgets/trending_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => CityCubit(),
        child: BlocBuilder<AppCubit , AppState>(
          builder: (context , state){
            state is LoadingChangeThemeState ? AppCubit.get(context).changeTheme(CacheHelper.getData(key: "Theme")) : "";
            return Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      radius: 1.5,
                      colors: [
                        wightColor,
                        secondColor,
                        titleColor,
                      ]
                  )
              ),
              child: SafeArea(
                child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      title: const CustomFadeAnimation(text: "Welcome, let's go traveling the world .."),
                    ),
                    drawer: const DrawerPage(),
                    // bottomNavigationBar: const Padding(
                    //   padding: EdgeInsets.all(15.0),
                    //   child: CustomStartButtonWidget(),
                    // ),
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CustomCarouselItem(imageUrl: "assets/images/London.jpg",),
                            ),
                            SizedBox(height: size.height * .02,),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: CustomTextField(
                            //     controller: searchController,
                            //     type: TextInputType.text,
                            //     label: "search by city name",
                            //     validator: (value){},
                            //     color1: defaultColor,
                            //     color2: defaultColor,
                            //     color3: defaultColor,
                            //     onSubmit: (){
                            //       // CityCubit.get(context).searchCity(cityName: searchController.text);
                            //       navigateWithFade(context, SearchResultScreen(cityName: searchController.text));
                            //     },
                            //     suffix: Icons.search,
                            //   ),
                            // ),
                            // SizedBox(height: size.height * .02,),
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state){
                                return SizedBox(
                                  height: size.height * .1,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                        child: CustomHomeCirclarWidget(
                                          function: (){
                                            navigateWithFade(context, HomeCubit.get(context).widgets[index]);
                                          },
                                          icon: HomeCubit.get(context).icons[index],
                                          title: HomeCubit.get(context).titles[index],
                                        ),
                                      );
                                    },
                                    itemCount: HomeCubit.get(context).titles.length,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: subTitleText("Trending :"),
                            ),
                            SizedBox(height: size.height * .01,),
                            SizedBox(
                              height: size.height * .40,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context , index) => const SizedBox(width: 10,),
                                itemBuilder: (context , index) => buildTrendingItem(
                                    size.height * .40,
                                    size.width * .6,
                                    context
                                ),
                                itemCount: 4,
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              ),
            );
          },
        ),
    );
  }
}

