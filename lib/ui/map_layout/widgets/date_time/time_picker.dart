import 'package:flutter/material.dart';

import '../../../../core/constants/colors_file.dart';

class CustomTimePicker extends StatefulWidget {
  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  double _timeValue = 0;
  final int startTime = 0;
  final int endTime = 1440;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _setCurrentTimeAsInitialValue();
  }

  void _setCurrentTimeAsInitialValue() {
    final now = DateTime.now();
    _timeValue = (now.hour * 60 + now.minute).toDouble();
  }

  String getTimeString(double value) {
    int hours = value ~/ 60;
    int minutes = (value % 60).toInt();
    String period = hours >= 12 ? 'PM' : 'AM';
    int displayHour = hours % 12 == 0 ? 12 : hours % 12;
    return '${displayHour.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')} $period';
  }

  List<String> generateHourlyLabels() {
    List<String> labels = [];
    for (int i = 0; i < 24; i++) {
      labels.add('${i % 12 == 0 ? 12 : i % 12} ${i < 12 ? 'AM' : 'PM'}');
    }
    return labels;
  }

  void _scrollToCurrentTime() {
    int totalIntervals = (endTime - startTime) ~/ 60;
    double intervalWidth = _scrollController.position.maxScrollExtent / totalIntervals;
    double targetOffset = (_timeValue / 60) * intervalWidth;

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            offset: const Offset(3, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                child: Row(
                  children: generateHourlyLabels()
                      .map(
                        (label) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        label,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4.0,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                overlayShape: SliderComponentShape.noOverlay,
              ),
              child: Slider(
                min: startTime.toDouble(),
                max: endTime.toDouble(),
                value: _timeValue,
                divisions: (endTime - startTime) ~/ 1,
                thumbColor: hPrimaryColor,
                activeColor:hPrimaryColor,
                inactiveColor: Colors.grey.shade300,
                label: getTimeString(_timeValue),
                onChanged: (value) {
                  setState(() {
                    _timeValue = value;
                    _scrollToCurrentTime();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
