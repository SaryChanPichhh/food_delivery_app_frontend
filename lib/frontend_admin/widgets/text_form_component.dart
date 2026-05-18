import 'package:flutter/material.dart';

class TextFormComponent extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType inputType;
  final bool obscureText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final bool showBorder;
  final bool readOnly;

  const TextFormComponent({
    super.key,
    required this.label,
    this.hint = '',
    this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.showBorder = true, // ✅ default value
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: showBorder ? 8 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: showBorder ? 4 : 0),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          TextFormField(
            readOnly: readOnly,
            controller: controller,
            keyboardType: inputType,
            obscureText: obscureText,
            validator: validator,
            onChanged: onChanged,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: showBorder
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 14)
                  : EdgeInsets.zero,
              border: showBorder ? borderStyle : InputBorder.none,
              enabledBorder: showBorder ? borderStyle : InputBorder.none,
              focusedBorder: showBorder
                  ? borderStyle.copyWith(
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                        width: 1.5,
                      ),
                    )
                  : InputBorder.none,
              errorBorder: showBorder
                  ? borderStyle.copyWith(
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 1.2,
                      ),
                    )
                  : InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
