import 'package:flutter/material.dart';
import 'package:travelt/screens/hotel/widgets/custom_hotel_gallery_item.dart';

class CustomGalleryList extends StatelessWidget {
  const CustomGalleryList({super.key, required this.images, required this.controller});

  final List<String> images;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        controller: controller,
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomHotelGalleryItem(image: images[index],),
          );
        },
      ),
    );
  }
}