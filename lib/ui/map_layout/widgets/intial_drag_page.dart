
import '../../../core/models/ride_details.dart';
import '../../../core/services/static_function.dart';
import '../../ui.dart';
import 'selection_button.dart';

class ColoredBoxWidget extends StatelessWidget {
  const ColoredBoxWidget({super.key, required this.dummyRides});

  final List<RideDetails> dummyRides;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              ' Schedule New Ride',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SelectionButton(
                    name: 'HOME',
                    icon:
                        Icon(Icons.home_outlined, size: 20, color: Colors.black),
                    borderRadius: 30,
                  ),
                  SelectionButton(
                    name: 'WORK',
                    icon: Icon(Icons.work_outline, size: 20, color: Colors.black),
                    borderRadius: 30,
                  ),
                  SelectionButton(
                    name: 'OTHER',
                    icon: Icon(Icons.location_on_outlined,
                        size: 20, color: Colors.black),
                    borderRadius: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              " Your Daily Rides",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dummyRides.length,
              itemBuilder: (context, index) {
                final ride = dummyRides[index];
                return listContainer(ride, index, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget listContainer(rideDetails, int index, context) {
  String date = rideDetails.date ?? 'Daily Route';
  date = date.isEmpty ? 'Daily Routine' : 'Scheduled Ride';
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.height,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Text(
                  rideDetails.time,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              const Text('Return back'),
              Transform.scale(
                scale: .60,
                child: Switch(
                  onChanged: (value) {},
                  value: false,
                  activeColor: Colors.greenAccent,
                  activeTrackColor: Colors.green,
                  inactiveThumbColor: Colors.grey[300],
                  inactiveTrackColor: Colors.grey[400],
                  thumbColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.green;
                    }
                    return Colors.white;
                  }),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 11,
                          height: 11,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              GlobalFunction.truncateString(rideDetails.pickupLocation, 28),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 11,
                          height: 11,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              GlobalFunction.truncateString(rideDetails.dropLocation, 30),
                              // Truncate destination to 20 characters
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Render ellipsis (...) when overflowed
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                child: Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              rideDetails.date.isEmpty
                  ? Row(
                      children: rideDetails.recurring.map((day) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green[500],
                            ),
                            child: Text(
                              day,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 6.0),
                      child: _formatDateString(rideDetails.date),
                    )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _formatDateString(String dateString) {
  List<String> dateParts = dateString.split('-');

  if (dateParts.length == 3) {
    int year = int.tryParse(dateParts[0]) ?? DateTime.now().year;
    int month = int.tryParse(dateParts[1]) ?? DateTime.now().month;
    int day = int.tryParse(dateParts[2]) ?? DateTime.now().day;

    DateTime parsedDate = DateTime(year, month, day);

    String monthName = _getMonthName(parsedDate.month);

    String dayWithDayName = ' ,${(parsedDate.day)}, ${parsedDate.year}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          monthName,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          dayWithDayName,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Return an empty Text widget if the date format is invalid
  return const Text('Invalid date format');
}

String _getMonthName(int month) {
  const monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  return monthNames[month - 1];
}
