import 'package:elemes_id_test/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchField extends ConsumerWidget {
  final String hintText;
  final Function(String value) onChanged;
  final bool autofocus;
  const SearchField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      autofocus: autofocus,
      decoration: InputDecoration(
        fillColor: AppThemes.lightGrey,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.p20),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppThemes.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16,
          vertical: Sizes.p12,
        ),
        hintText: hintText,
        hintStyle: AppThemes.text2.copyWith(color: AppThemes.grey),
      ),
      onChanged: onChanged,
    );
  }
}
