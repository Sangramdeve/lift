import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/map_bloc/map_bloc.dart';
import 'package:lift/bloc/map_bloc/map_event.dart';
import 'package:lift/core/models/place_model.dart';

import '../../ui.dart';

class PlaceSuggestions extends StatelessWidget {
  const PlaceSuggestions({super.key, required this.placeSuggestionsList});

  final List<PlaceName> placeSuggestionsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
          child: locate(context),
        ),
        Flexible(
          child: ListView.builder(
              itemCount: placeSuggestionsList.length,
              itemBuilder: (context, index) {
                final placeSuggestions = placeSuggestionsList[index];
                return ListTile(
                  title: Text(placeSuggestions.location),
                  onTap: () {
                    context.read<MapBloc>().add(
                        PlaceSelected(placeName: placeSuggestions.location));

                    context.read<MapBloc>().add(
                        ShowMatches());
                  },
                );
              }),
        ),
      ],
    );
  }
}

Widget locate(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 20),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            context
                .read<MapBloc>()
                .add(const LocateEvents(locateType: 'Locate_on_map'));
          },
          child: const Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 5),
              Text(
                'Locate on map',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Spacer(),
        const SizedBox(
          height: 24,
          child: VerticalDivider(color: Colors.grey),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context
                .read<MapBloc>()
                .add(const LocateEvents(locateType: 'current_Location'));
          },
          child: const Row(
            children: [
              Icon(Icons.my_location),
              SizedBox(width: 5),
              Text(
                'Current Location',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
