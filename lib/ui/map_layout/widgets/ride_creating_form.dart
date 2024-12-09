import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/map_bloc/map_bloc.dart';
import '../../../bloc/map_bloc/map_event.dart';
import '../../../core/constants/colors_file.dart';
import '../../ui.dart';
import 'custom_button.dart';
import 'date_time/time_picker.dart';
import 'selection_button.dart';

class RideForm extends StatefulWidget {
  const RideForm({super.key});

  @override
  State<RideForm> createState() => _RideFormState();
}

class _RideFormState extends State<RideForm> {
  // Track selected days for week scheduling
  final List<bool> isSelected = List.generate(7, (_) => false);
  final List<String> selectedDays = [];
  bool isRepetitive = true; // Toggle between Today/Repetitive views

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'I want to go from',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "HOME → WORK",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "or somewhere else",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectionButton(
                  name: 'Today',
                  borderRadius: 15,
                  icon: Icon(Icons.today, color: hPrimaryColor),
                ),
                SelectionButton(
                  name: 'Repetitive Ride',
                  borderRadius: 15,
                  icon: Icon(Icons.repeat, color: hPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            true ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isRepetitive ? 'Select Days' : 'Select Time',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                 week(),
              ],
            ) : const SizedBox.shrink(),
            const SizedBox(height: 10),
            const Text(
             'Select Time',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            CustomTimePicker(),
            const SizedBox(height: 10),
            Row(
              children: [
                CustomButtons(
                  text: 'Cancel',
                  onTap: () {
                    context.read<MapBloc>().add(const ConfirmButtons(confirmValue: 'Cancel'));
                  },
                ),
                CustomButtons(
                  text: 'Search Location',
                  onTap: () {
                    context.read<MapBloc>().add(const ConfirmButtons(confirmValue: 'Search Location'));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget week() {
    final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(days.length, (index) {
        final bool selected = isSelected[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected[index] = !isSelected[index];
              if (isSelected[index]) {
                selectedDays.add(days[index]);
              } else {
                selectedDays.remove(days[index]);
              }
            });
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? hPrimaryColor : Colors.grey[200],
              boxShadow: selected
                  ? [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.4),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ]
                  : [],
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              days[index],
              style: TextStyle(
                fontSize: 14.0,
                color: selected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }
}
