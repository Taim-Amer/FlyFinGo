import 'package:flutter/material.dart';

class CustomMyBookingHousesItem extends StatelessWidget {
  final int id;
  final String location;
  final int space;
  final String status;
  final String start;
  final String end;
  final int total;


  CustomMyBookingHousesItem({
    super.key,
    required this.id,
    required this.location,
    required this.space,
    required this.status,
    required this.start,
    required this.end,
    required this.total,
  });

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location and Space Info
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const Spacer(),
                    _buildFeatureIcon(Icons.square_foot, '$space sqm', Colors.blue),
                  ],
                ),
                const SizedBox(height: 16),

                  _buildBookingInfo(
                    bookingStatus: status,
                    startDate: start,
                    endDate: end,
                    total: total,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildBookingInfo({
    required String bookingStatus,
    required String startDate,
    required String endDate,
    required int total,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Status: $bookingStatus',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildFeatureIcon(Icons.calendar_today, 'Start: $startDate', Colors.green),
            const SizedBox(width: 16),
            _buildFeatureIcon(Icons.calendar_today, 'End: $endDate', Colors.red),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Total: \$$total',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
