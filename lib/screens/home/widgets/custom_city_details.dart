import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/map_screen.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_divider.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomCityDetails extends StatefulWidget {

  CustomCityDetails({
    super.key,
    required this.cityName,
    required this.description,
    required this.height,
    required this.width,
    required this.lat,
    required this.long,
    this.function,
    this.imageUrl,
  });

  final String cityName;
  final String description;
  final double height;
  final double width;
  String? imageUrl;
  final double lat;
  final double long;
  final VoidCallback? function;

  @override
  _CustomCityDetailsState createState() => _CustomCityDetailsState();
}

class _CustomCityDetailsState extends State<CustomCityDetails> {
  bool isExpanded = true;

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _toggleExpand();
      },
      child: Container(
        height: isExpanded ? 400 : 100,
        width: widget.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: defaultColor,
              offset: const Offset(1,1),
            )
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              widget.imageUrl ?? "assets/images/city.jpg",
            ),
            colorFilter: ColorFilter.mode(
              wightColor.withOpacity(0.7),
              BlendMode.dstATop,
            ),
          ),
          color: Colors.transparent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: !isExpanded ? Center(
          child: ListTile(
            title: titleText(
              size: 20,
              widget.cityName,
            ),
            trailing: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: IconButton(
                iconSize: 30,
                onPressed: (){
                  navigateWithSlideFromRight(context, MapScreen(lat: widget.lat, long: widget.long));
                },
                icon: const Icon(Iconsax.location),
              ),
            ),
          ),
        ) : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: titleText(widget.cityName, size: 20),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      iconSize: 30,
                      onPressed: (){
                        navigateWithSlideFromRight(context, MapScreen(lat: widget.lat, long: widget.long));
                      },
                      icon: const Icon(Iconsax.location),
                    ),
                  ),
                ],
              ),
              detailsText(widget.description , size: 15, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
