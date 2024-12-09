import '../../../core/constants/colors_file.dart';
import '../../ui.dart';

class CustomButtons extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? iconUrl;

  const CustomButtons({
    super.key,
    required this.text,
    required this.onTap,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            minimumSize: const Size(double.maxFinite, 50),
            backgroundColor: hBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey.shade300),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(iconUrl != null)
                 Padding(
                    padding: const EdgeInsets.all(10),
                  child: Image.asset(
                      iconUrl!,
                    width: 28,
                    height: 28,
                  ),
                ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18, // Decreased text size
                ),
              ),
            ],
          ),
      ),
    );
  }
}
