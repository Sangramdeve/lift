import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/map_bloc/map_bloc.dart';
import '../../../bloc/map_bloc/map_event.dart';
import '../../../core/constants/colors_file.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({super.key, required this.isLeftSelected});
  final bool isLeftSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50, // Adjust height as needed
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            // Left Option
            Expanded(
              child: GestureDetector(
                onTap: (){
                  context.read<MapBloc>().add(Lift());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isLeftSelected ? hPrimaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Ask Lift',
                      style: TextStyle(
                        color: isLeftSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Right Option
            Expanded(
              child: GestureDetector(
                onTap: (){
                  context.read<MapBloc>().add(Lift());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: !isLeftSelected ? hPrimaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      'Share Lift',
                      style: TextStyle(
                        color: !isLeftSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
