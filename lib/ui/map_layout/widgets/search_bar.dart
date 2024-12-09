import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/map_bloc/map_bloc.dart';
import 'package:lift/bloc/map_bloc/map_event.dart';
import 'package:lift/core/services/static_function.dart';

import '../../ui.dart';

class PlaceSearchBar extends StatelessWidget {
  const PlaceSearchBar({super.key, required this.placeName});
  final String placeName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(Icons.menu, size: 28, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 7),
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          GestureDetector(
            onTap: () {
              // with this event use geocoding place name as current location
              // search only drop location
              // also give user to update the current location field
              context.read<MapBloc>().add(const ShowSearchField(searchType: 'search_bar'));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                GlobalFunction.truncateString(placeName,30),
                style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

