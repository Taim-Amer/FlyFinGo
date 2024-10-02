import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/inside_house_model.dart';
import 'package:travelt/screens/house/cubit/house_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_date_picker.dart';
import 'package:travelt/widgets/custom_outline_form_field.dart';

class CustomHouseItem extends StatefulWidget {
  final int id;
  final int space;
  final String location;
  final String description;
  final int monthlyRent;
  final int personNum;
  final int rooms;
  final int baths;
  final String verificationStatus;
  late bool isFavorite;
  final String photoUrl;
  static bool isSeeMore = false;
  static InsideHouseModel? insideHouseModel;

  CustomHouseItem({
    super.key,
    required this.space,
    required this.location,
    required this.description,
    required this.monthlyRent,
    required this.personNum,
    required this.rooms,
    required this.baths,
    required this.verificationStatus,
    required this.isFavorite,
    required this.photoUrl,
    required this.id,
  });

  @override
  _CustomHouseItemState createState() => _CustomHouseItemState();
}

class _CustomHouseItemState extends State<CustomHouseItem> {
  bool _isExpanded = false;
  bool _isLoading = false;

  var startController = TextEditingController();
  var monthController = TextEditingController();

  void _onBookNowPressed() {
    if (_isExpanded) {
      int? months = int.tryParse(monthController.text);
      if (months != null && startController.text.isNotEmpty) {
        HouseCubit.get(context).bookHouse(
          homeId: widget.id,
          start: startController.text,
          months: months,
        );
      }
    } else {
      setState(() {
        _isExpanded = true;
      });
    }
  }

  Future<void> _onSeeMorePressed() async {
    setState(() {
      _isLoading = true;
    });

    await HouseCubit.get(context).insideHousePage(homeId: widget.id);

    setState(() {
      _isLoading = false;
      CustomHouseItem.insideHouseModel =
          HouseCubit.get(context).insideHouseModel;
      CustomHouseItem.isSeeMore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // House image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              "assets/images/House1.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          _isLoading
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                )
              : CustomHouseItem.isSeeMore!
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (CustomHouseItem
                                  .insideHouseModel?.data?.features?.message !=
                              null)
                            _buildFeatureItem(
                              icon: Icons.info_outline,
                              label: 'Features',
                              content: CustomHouseItem
                                  .insideHouseModel!.data!.features!.message!,
                              iconColor: Colors.red,
                            ),
                          const SizedBox(height: 16),
                          if (CustomHouseItem.insideHouseModel?.data
                                  ?.homeOwnerData!.ownerName !=
                              null)
                            _buildFeatureItem(
                              icon: Icons.person_outline,
                              label: 'Owner Name',
                              content: CustomHouseItem.insideHouseModel!.data!
                                  .homeOwnerData!.ownerName!,
                              iconColor: Colors.blue,
                            ),
                          const SizedBox(height: 16),
                          if (CustomHouseItem.insideHouseModel?.data
                                  ?.homeOwnerData!.ownerNumber !=
                              null)
                            _buildFeatureItem(
                              icon: Icons.phone_outlined,
                              label: 'Owner Contact',
                              content: CustomHouseItem.insideHouseModel!.data!
                                  .homeOwnerData!.ownerNumber!,
                              iconColor: Colors.green,
                            ),
                          const SizedBox(height: 16),
                          CustomButton(
                            function: () {
                              setState(() {
                                CustomHouseItem.isSeeMore = false;
                              });
                            },
                            text: "Back",
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Description
                          Text(
                            widget.description,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Location
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.red),
                              const SizedBox(width: 4),
                              Text(
                                widget.location,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildFeatureIcon(Icons.king_bed,
                                  '${widget.rooms} Rooms', Colors.orange),
                              _buildFeatureIcon(Icons.bathtub,
                                  '${widget.baths} Baths', Colors.blue),
                              _buildFeatureIcon(Icons.people,
                                  '${widget.personNum} People', Colors.green),
                              _buildFeatureIcon(
                                  Icons.attach_money,
                                  '${widget.monthlyRent} / month',
                                  Colors.purple),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              widget.verificationStatus == "Verified"
                                  ? const Row(
                                      children: [
                                        Icon(Icons.verified,
                                            color: Colors.blue),
                                        SizedBox(width: 4),
                                        Text(
                                          'Verified',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  : const Text('Not Verified'),
                              const Spacer(),
                              BlocBuilder<HouseCubit, HouseState>(
                                  builder: (context, state){
                                    if(state is ChangeHouseFavouriteSuccessState){
                                      widget.isFavorite = HouseCubit.get(context).isFav;
                                    }
                                    return IconButton(
                                      icon: Icon(
                                        widget.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: widget.isFavorite
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        // setState(() {
                                        //   widget.isFavorite = !widget.isFavorite;
                                        // });
                                        HouseCubit.get(context).changeHouseFavourite(homeId: widget.id);
                                      },
                                    );
                                  }),
                            ],
                          ),
                          const SizedBox(height: 8),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: _isExpanded ? 90.0 : 0.0,
                            child: _isExpanded
                                ? Column(
                                    children: [
                                      Divider(color: Colors.grey[300]),
                                      SizedBox(
                                        height: 50,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: CustomDatePicker(
                                                hint: "Start date",
                                                height: 50,
                                                dateController: startController,
                                                textColor: defaultColor,
                                                hintColor: defaultColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                              child: CustomOutlinedTextField(
                                                controller: monthController,
                                                hintText: "Month number",
                                                type: TextInputType.number,
                                                textColor: defaultColor,
                                                hintColor: defaultColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : null,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _onBookNowPressed,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: defaultColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(
                                        color: wightGreyColor, fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed:
                                      _isLoading ? null : _onSeeMorePressed,
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: secondColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'See More',
                                    style: TextStyle(
                                        color: defaultColor, fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
          // :SizedBox()
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String label,
    required String content,
    required Color iconColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }
}
