import 'package:flutter/material.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';

class CustomFlightRoundItem extends StatefulWidget {
  const CustomFlightRoundItem({
    Key? key,
    required this.dateGo,
    required this.takeoffGo,
    required this.landingGo,
    required this.durationGo,
    required this.dateBack,
    required this.takeoffBack,
    required this.landingBack,
    required this.durationBack,
    required this.capacity,
    required this.officeName,
    required this.currentCity,
    required this.destinationCity,
    required this.services,
    required this.isEnable,
    required this.id,
  }) : super(key: key);

  final String dateGo;
  final String takeoffGo;
  final String landingGo;
  final String durationGo;
  final String dateBack;
  final String takeoffBack;
  final String landingBack;
  final String durationBack;
  final String officeName;
  final String currentCity;
  final String destinationCity;
  final int capacity;
  final List<String> services;
  final bool isEnable;
  final int id;

  @override
  _CustomFlightRoundItemState createState() => _CustomFlightRoundItemState();
}

class _CustomFlightRoundItemState extends State<CustomFlightRoundItem> {
  int personNumber = 1;

  void incrementCount() {
    if (personNumber < widget.capacity) {
      setState(() {
        personNumber++;
      });
    }
  }

  void decrementCount() {
    if (personNumber > 1) {
      setState(() {
        personNumber--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/flight_background.jpg', // Path to your background image
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          // Foreground Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.flight_takeoff, color: Colors.blue, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      'Office: ${widget.officeName}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                const Divider(color: Colors.white70),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'From: ${widget.currentCity}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.location_on, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'To: ${widget.destinationCity}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, color: Colors.blueAccent, size: 20),
                            const SizedBox(width: 8),
                            Text('Date: ${widget.dateGo}', style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.schedule, color: Colors.blueAccent, size: 20),
                            const SizedBox(width: 8),
                            Text('Takeoff: ${widget.takeoffGo}', style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.landscape, color: Colors.blueAccent, size: 20),
                            const SizedBox(width: 8),
                            Text('Landing: ${widget.landingGo}', style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.timer, color: Colors.blueAccent, size: 20),
                            const SizedBox(width: 8),
                            Text('Duration: ${widget.durationGo}', style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, color: Colors.redAccent, size: 20),
                            const SizedBox(width: 8),
                            Text('Return Date: ${widget.dateBack}', style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.schedule, color: Colors.redAccent, size: 20),
                            const SizedBox(width: 8),
                            Text('Takeoff: ${widget.takeoffBack}', style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.landscape, color: Colors.redAccent, size: 20),
                            const SizedBox(width: 8),
                            Text('Landing: ${widget.landingBack}', style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.timer, color: Colors.redAccent, size: 20),
                            const SizedBox(width: 8),
                            Text('Duration: ${widget.durationBack}', style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.people, color: Colors.orange, size: 24),
                        const SizedBox(width: 8),
                        Text('Persons: $personNumber', style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: decrementCount,
                          icon: const Icon(Icons.remove_circle, color: Colors.red),
                        ),
                        IconButton(
                          onPressed: incrementCount,
                          icon: const Icon(Icons.add_circle, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Services:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.services.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                widget.services[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: widget.isEnable ? () {
                    FlightCubit.get(context).bookFlightRound(
                        personNumber: personNumber,
                        classId: 1,
                        flightRoundId: widget.id
                    );
                  } : null,
                  icon: const Icon(Icons.flight, color: wightGreyColor),
                  label: const Text('Book Now' , style: TextStyle(color: wightGreyColor),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: defaultColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
