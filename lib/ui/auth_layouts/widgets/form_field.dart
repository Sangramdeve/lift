import '../../ui.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.prefixIcon,
    this.message,
    this.onChanged,
    required this.hintTextMessage,
    required this.controller,
  });

  final TextEditingController controller;
  final String hintTextMessage;
  final Widget? prefixIcon;
  final String? message;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintTextMessage,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          prefixIcon: prefixIcon,
          errorText: message,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          )),
      onChanged: onChanged,
    );
  }
}
