import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lift/bloc/map_bloc/map_event.dart';
import 'package:lift/bloc/map_bloc/map_state.dart';
import 'package:lift/ui/map_layout/widgets/drag_sheet.dart';
import 'package:lift/ui/map_layout/widgets/place_suggestions.dart';
import 'package:lift/ui/map_layout/widgets/search_bar.dart';
import 'package:lift/ui/map_layout/widgets/search_field.dart';

import '../../bloc/map_bloc/map_bloc.dart';
import '../../core/constants/json_data.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  DraggableScrollableController dragController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    print('MapScreen');
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _buildDrawerItem(context, 'AnimatedAlign'),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            MapBloc(RepositoryProvider.of(context))..add(OnMapCreated()),
        child: SafeArea(
          child: Stack(
            children: [
              BlocListener<MapBloc, MapState>(
                listener: (context, state) {
                  if (state.updateMap) {
                    mapController.animateCamera(CameraUpdate.newLatLngZoom(
                        state.currentLocation, state.zoom));
                  }
                },
                child: BlocBuilder<MapBloc, MapState>(
                  builder: (context, state) {
                    return GoogleMap(
                      onMapCreated: (controller) {
                        mapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                        target: state.currentLocation,
                        zoom: state.zoom,
                      ),
                      style: mapStyle,
                      zoomControlsEnabled: false,
                      myLocationEnabled: true,
                    );
                  },
                ),
              ),
              BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  return state.showMatchedRides
                      ? Container(
                          height: screenHeight / 2,
                          width: screenWidth,
                          color: Colors.blueAccent,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 15, right: 15),
                          child: PlaceSearchBar(placeName: state.placeName),
                        );
                },
              ),
              BlocBuilder<MapBloc, MapState>(
                builder: (context, state) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    bottom:
                        state.showPlaceSuggestions ? 0 : -screenHeight * 0.71,
                    left: 0,
                    right: 0,
                    height: screenHeight * 0.71,
                    child: Container(
                      height: 220,
                      color: Colors.white,
                      child: PlaceSuggestions(
                        placeSuggestionsList: state.placeSuggestions,
                      ),
                    ),
                  );
                },
              ),
              SearchFields(
                screenHeight: screenHeight,
              ),
              DragSheet(
                controller: dragController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDrawerItem(
  BuildContext context,
  String title,
) {
  return ListTile(
    title: Text(title),
    onTap: () {
      // Close the drawer before navigating
      Navigator.pop(context);
    },
  );
}
