import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_picker/country_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:salah_learning_prayer/providers/setting_providers/setting_provider.dart';
import 'package:salah_learning_prayer/screens/settings/widgets/settings_switch_tile.dart';
import 'package:salah_learning_prayer/screens/settings/widgets/settings_tile.dart';
import '../../models/gender.dart';

class Settingscreen extends ConsumerWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final settingsAsync =
        ref.watch(appSettingsProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF4F6F8),
     appBar: AppBar(
          toolbarHeight: 72,
        elevation: 0,
        centerTitle: false,
        backgroundColor: Color(0xFF016568),

         leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

        title: Text(
          "Settings",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),

        actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 32,),
          onPressed: () {
            // open settings
          },
        ),
      ),
    ],
  ),
      
      body: settingsAsync.when(

        loading: () =>
            const Center(child: CircularProgressIndicator()),

        error: (e, _) =>
            Center(child: Text(e.toString())),

        data: (settings) {

          final notifier =
              ref.read(appSettingsProvider.notifier);

          return ListView(
            padding: const EdgeInsets.all(18),
            children: [

              /// COUNTRY
              SettingsTile(
                label: "Country",
                value: settings.country,
                onTap: () {

                  if (settings.autoLocation) return;

                  showCountryPicker(
  context: context,
  onSelect: (country) async {

    final locations =
        await locationFromAddress(country.name);

    if (locations.isNotEmpty) {

      final location = locations.first;

      notifier.updateManualLocation(
        country: country.name,
        lat: location.latitude,
        lng: location.longitude,
      );
    }
  },
);

                },
              ),

              /// GENDER
              SettingsTile(
                label: "Gender",
                value: settings.gender
                    == Gender.male
                    ? "Male"
                    : "Female",
                onTap: () {

                  showModalBottomSheet(
                    context: context,
                    builder: (_) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        ListTile(
                          title: const Text("Male"),
                          onTap: () {
                            notifier.updateGender(
                                Gender.male);
                            Navigator.pop(context);
                          },
                        ),

                        ListTile(
                          title: const Text("Female"),
                          onTap: () {
                            notifier.updateGender(
                                Gender.female);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),

              /// LANGUAGE
              SettingsTile(
                label: "Language",
                value: settings.language,
                onTap: () {

                  showModalBottomSheet(
                    context: context,
                    builder: (_) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        ListTile(
                          title:
                              const Text("English"),
                          onTap: () {
                            notifier.updateLanguage(
                                "English");
                            Navigator.pop(context);
                          },
                        ),

                        ListTile(
                          title: const Text("Urdu"),
                          onTap: () {
                            notifier.updateLanguage(
                                "Urdu");
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              /// AUTO LOCATION
              SettingsSwitchTile(
                title: "Auto Detect Location",
                value: settings.autoLocation,
                onChanged:
                    notifier.toggleAutoLocation,
              ),
            ],
          );
        },
      ),
    );
  }
}
