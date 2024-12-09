import 'package:flutter/material.dart';

import '../../../core/constants/colors_file.dart';

class CustomButtons extends StatelessWidget {
  final String text;
  final VoidCallback onTap;


  const CustomButtons({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: hPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.grey.shade300),
              )),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
