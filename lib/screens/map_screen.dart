import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_floating_action.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double long;

  const MapScreen({super.key, required this.lat, required this.long});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapController _mapController;
  double _currentZoom = 15.0;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _zoomIn() {
    setState(() {
      _currentZoom++;
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom--;
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  void _goToCurrentLocation() {
    _mapController.move(LatLng(widget.lat, widget.long), _currentZoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(widget.lat, widget.long),
              zoom: _currentZoom,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(widget.lat, widget.long),
                    builder: (ctx) => Icon(
                      Icons.location_on,
                      color: defaultColor,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              children: [
                CustomFloatingAction(
                    color1: defaultColor,
                    color2: wightColor,
                    function: _zoomIn,
                    icon: Iconsax.add,
                ),
                const SizedBox(height: 8),
                CustomFloatingAction(
                  color1: defaultColor,
                  color2: wightColor,
                  function: _zoomOut,
                  icon: Iconsax.search_zoom_out,
                ),
                const SizedBox(height: 8),
                CustomFloatingAction(
                  color1: defaultColor,
                  color2: wightColor,
                  function: _goToCurrentLocation,
                  icon: Icons.my_location,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
