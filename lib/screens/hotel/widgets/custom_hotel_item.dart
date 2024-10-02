import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/hotel/widgets/custom_circlar_location_button.dart';
import 'package:travelt/screens/hotel/widgets/custom_circlar_favourite_button.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomHotelItem extends StatelessWidget {
  const CustomHotelItem({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.phone,
    required this.rate,
    required this.function,
    required this.buttonFunction,
    required this.isFavourite,
    required this.lat, required this.long, required this.photoUrl,
  });

  final String name;
  final String description;
  final String price;
  final String phone;
  final String rate;
  final VoidCallback? function;
  final VoidCallback buttonFunction;
  final bool isFavourite;
  final double lat;
  final double long;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 330,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                  leading: CustomCirclarLocationButton(lat: lat,long: long,),
                  title: titleText(size: 20, name),
                  subtitle: detailsText(size: 15, description),
                  trailing: CustomCirclarFavouriteButton(
                    icon: Iconsax.heart,
                    function: buttonFunction,
                    isFavouite: isFavourite,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(color: Colors.green, Iconsax.call),
                          ),
                          subTitleText(size: 18, phone),
                        ],
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(color: Colors.amber, Iconsax.star),
                          ),
                          subTitleText(size: 18, rate),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            secondColor.withOpacity(0.8),
                            BlendMode.dstATop,
                          ),
                          fit: BoxFit.fitWidth,
                          // image: CachedNetworkImageProvider(photoUrl,),
                          image:  AssetImage("assets/images/Four Seasons.jpg"),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.6, 1],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
