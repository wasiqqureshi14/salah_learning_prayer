import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

void showSmallCountryPicker(
  BuildContext context,
  Function(Country) onSelect,
) {

  showCountryPicker(
    context: context,

    /// makes UI feel like dropdown instead of fullscreen
    useSafeArea: true,

    showPhoneCode: false,

    countryListTheme: CountryListThemeData(

      /// 👇 THIS CONTROLS HEIGHT
      bottomSheetHeight: 450,

      /// rounded smaller modal
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),

      /// search field styling
      inputDecoration: InputDecoration(
        hintText: "Search country",
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
      ),

      /// removes fullscreen feeling
      backgroundColor: Colors.white,
    ),

    onSelect: (Country country) async {

      /// highlight feel + smooth UX delay
      await Future.delayed(
        const Duration(milliseconds: 350),
      );

      onSelect(country);
    },
  );
}
