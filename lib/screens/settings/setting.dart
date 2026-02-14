import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_picker/country_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:salah_learning_prayer/screens/prayer_alram/prayer_alarm_screen.dart';
import 'package:salah_learning_prayer/screens/settings/widgets/country_picker.dart';
import 'package:salah_learning_prayer/screens/settings/widgets/setting_card.dart';
import '../../models/gender.dart';
import '../../providers/setting_providers/setting_provider.dart';
import 'widgets/settings_switch_tile.dart';
import 'widgets/settings_tile.dart';

class Settingscreen extends ConsumerWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final settingsAsync = ref.watch(appSettingsProvider);

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
            padding: const EdgeInsets.all(16),
            children: [

              /// MAIN CARD
              SettingsSectionCard(
                child: Column(
                  children: [

                    SettingsTile(
                      label: "Country",
                      value: settings.country,
                      onTap: () {

                        if (settings.autoLocation) return;

                      showSmallCountryPicker(
  context,
  (country) async {
    final locations =
        await locationFromAddress(country.name);

    final loc = locations.first;

    notifier.updateManualLocation(
      country: country.name,
      lat: loc.latitude,
      lng: loc.longitude,
    );
  },
);

                      },
                    ),

                    SettingsTile(
                      label: "Timezone",
                      value: settings.timezone,
                      onTap: () {},
                    ),

                    SettingsTile(
                      label: "Gender",
                      value: settings.gender == Gender.male
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
                                  notifier.updateGender(Gender.male);
                                  Navigator.pop(context);
                                },
                              ),

                              ListTile(
                                title: const Text("Female"),
                                onTap: () {
                                  notifier.updateGender(Gender.female);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),

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
                                title: const Text("English"),
                                onTap: () {
                                  notifier.updateLanguage("English");
                                  Navigator.pop(context);
                                },
                              ),

                              ListTile(
                                title: const Text("Urdu"),
                                onTap: () {
                                  notifier.updateLanguage("Urdu");
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SettingsSwitchTile(
                      title: "Namaz Time Alert",
                      value: settings.namazAlert,
                      onChanged: notifier.toggleNamazAlert,
                    ),

                    SettingsSwitchTile(
                      title: "Notifications",
                      value: settings.notifications,
                      onChanged: notifier.toggleNotifications,
                    ),

                    SettingsSwitchTile(
                      title: "Auto Detect Location",
                      value: settings.autoLocation,
                      onChanged: notifier.toggleAutoLocation,
                    ),
                  ],
                ),
              ),

                       

              const SizedBox(height: 18),

              /// PRAYER CALCULATION
             Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: const Color(0xFF016568)),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [

          const Text(
            "Prayer Calculation",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF016568),
            ),
          ),

          Switch(
            value: settings.prayerCalculation,
            onChanged:
                notifier.togglePrayerCalculation,
            activeColor: const Color(0xFF016568),
          ),
        ],
      ),

      const SizedBox(height: 6),

      const Text(
        "Get prayer times using nearby mosque or method based on your location",
        style: TextStyle(fontSize: 13, color: Colors.black),
      ),

      const SizedBox(height: 6),

      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF016568),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              "Fajr: ${settings.fajrAngle}° / Isha: ${settings.ishaAngle}°",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              settings.calculationMethod,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
              

              const SizedBox(height: 18),

             TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PrayerAlarmScreen(),
      ),
    );
  },
  style: TextButton.styleFrom(
    padding: EdgeInsets.zero, // keeps same alignment
    alignment: Alignment.centerLeft,
  ),
  child: const Text(
    "Prayer Time Alarm",
    style: TextStyle(
      fontWeight: FontWeight.w700,
      color: Color(0xFF016568),
      fontSize: 16,
    ),
  ),
),

              
            ],
          );
        },
      ),
    );
  }
}
