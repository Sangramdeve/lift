import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/map_bloc/map_bloc.dart';
import 'package:lift/bloc/map_bloc/map_event.dart';

import '../../../bloc/map_bloc/map_state.dart';
import '../../ui.dart';

class SearchFields extends StatelessWidget {
  SearchFields({super.key, required this.screenHeight});

  final double screenHeight;

  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropController = TextEditingController();
  final FocusNode pickupNode = FocusNode();
  final FocusNode dropNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return AnimatedPositioned(
          height: screenHeight / 4,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          top: state.showPlaceSuggestions ? 0 : -300,
          left: 0,
          right: 0,
          child: Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // for clear the state
                        context.read<MapBloc>().add(
                            const ShowSearchField(searchType: 'clear_State'));
                      },
                    ),
                    title: Builder(
                      builder: (BuildContext context) {
                        return const Text(
                          'Pick Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<MapBloc, MapState>(
                          builder: (context, state) {
                            pickupController.text = state.pickUp;
                            if (state.textSelection == 'search_bar') {
                              Future.delayed(const Duration(milliseconds: 600))
                                  .then((_) => pickupNode.requestFocus());
                              pickupController.selection = TextSelection(
                                baseOffset: 0,
                                extentOffset: pickupController.text.length,
                              );
                            }
                            return Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.green),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: pickupController,
                                    focusNode: pickupNode,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                      hintText: 'Pick-up location',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 16),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]!),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.blueAccent),
                                      ),
                                      suffixIcon: pickupController
                                              .text.isNotEmpty
                                          ? IconButton(
                                              icon: const Icon(Icons.clear,
                                                  color: Colors.grey),
                                              onPressed: () {
                                                pickupController.clear();
                                                context.read<MapBloc>().add(
                                                    const ClearTextFieldState(
                                                        textField: 'Pick-up'));
                                              })
                                          : null,
                                    ),
                                    onChanged: (value) {
                                      context.read<MapBloc>().add(
                                            OnPickupLocationFieldChanged(
                                              pickUpEvent: value,
                                            ),
                                          );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const Divider(height: 20, thickness: 1),
                        BlocBuilder<MapBloc, MapState>(
                          builder: (context, state) {
                            dropController.text = state.dropOff;
                            if (state.textSelection == 'Search Destination') {
                              Future.delayed(const Duration(milliseconds: 600))
                                  .then((_) => dropNode.requestFocus());
                            }
                            return Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.red),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: dropController,
                                    focusNode: dropNode,
                                    style: const TextStyle(
                                        fontSize: 15),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                      hintText: 'Drop-off location',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 15),

                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]!),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.blueAccent),
                                      ),
                                      suffixIcon: dropController.text.isNotEmpty
                                          ? IconButton(
                                              icon: const Icon(Icons.clear,
                                                  color: Colors.grey),
                                              onPressed: () {
                                                dropController.clear();
                                                context.read<MapBloc>().add(
                                                    const ClearTextFieldState(
                                                        textField: 'Drop-off'));
                                              })
                                          : null,
                                    ),
                                    onChanged: (value) {
                                      context.read<MapBloc>().add(
                                            DropOffFieldChanged(
                                                dropOffEvent: value),
                                          );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
