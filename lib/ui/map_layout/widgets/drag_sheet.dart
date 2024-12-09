import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lift/ui/map_layout/widgets/custom_toggle.dart';
import 'package:lift/ui/map_layout/widgets/intial_drag_page.dart';
import 'package:lift/ui/map_layout/widgets/ride_creating_form.dart';

import '../../../bloc/map_bloc/map_bloc.dart';
import '../../../bloc/map_bloc/map_event.dart';
import '../../../bloc/map_bloc/map_state.dart';
import '../../../core/models/ride_details.dart';
import '../../ui.dart';

class DragSheet extends StatelessWidget {
  DragSheet({super.key, required this.controller});

  final DraggableScrollableController controller;

  final List<RideDetails> dummyRides = [
    RideDetails(
      time: '08:30 AM',
      date: '2024-11-14',
      pickupLatLng: const LatLng(37.7749, -122.4194),
      dropLocation: 'Union Square, San Francisco',
      dropLatLng: const LatLng(37.7879, -122.4074),
      fare: '\$15.00',
      hasVehicle: true,
      recurring: ['Monday', 'Wednesday', 'Friday'],
      polyLines: ['encodedPolyline1'],
      pickupLocation: '123 Main St, San Francisco',
    ),
    RideDetails(
      time: '10:15 AM',
      date: '2024-11-15',
      pickupLatLng: const LatLng(34.0522, -118.2437),
      dropLocation: 'Santa Monica Pier, Los Angeles',
      dropLatLng: const LatLng(34.0100, -118.4969),
      fare: '\$25.00',
      hasVehicle: false,
      recurring: ['Tuesday', 'Thursday'],
      polyLines: ['encodedPolyline2'],
      pickupLocation: '456 Sunset Blvd, Los Angeles',
    ),
    RideDetails(
      time: '07:45 PM',
      date: '2024-11-16',
      pickupLatLng: const LatLng(40.7128, -74.0060),
      dropLocation: 'Central Park, New York',
      dropLatLng: const LatLng(40.7851, -73.9683),
      fare: '\$30.00',
      hasVehicle: true,
      recurring: ['Saturday'],
      polyLines: ['encodedPolyline3'],
      pickupLocation: '789 Broadway, New York',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print('DraggableScrollableSheet outside BlocBuilder object');

    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        print('DraggableScrollableSheet inside BlocBuilder object');
        return DraggableScrollableSheet(
          initialChildSize: state.snapSize,
          minChildSize: state.snapSize,
          maxChildSize: state.maxChildSize,
          controller: controller,
          snap: true,
          snapSizes: [state.snapSize],
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    state.locationForm
                        ? CustomToggleButton(
                            isLeftSelected: state.isLeftSelected,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: GestureDetector(
                              onTap: () {
                                //with this event use geocoding place name as current location
                                //search only drop location
                                context.read<MapBloc>().add(
                                    const ShowSearchField(
                                        searchType: 'Search Destination'));
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.search, color: Colors.green),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          'Search Destination',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),

                    state.locationForm
                        ? const RideForm()
                        : ColoredBoxWidget(
                            dummyRides: dummyRides,
                          )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Widget addRoute() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 345,
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.blue,
                size: 32,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add a new daily route',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to create a route for match with other',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[700],
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
