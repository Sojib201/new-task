import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Localization extends StatefulWidget {
  const Localization({super.key});

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('en', 'US'),);
                  },
                  child: const Text("English")),
              ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('bn', 'BN'),);
                  },
                  child: const Text("বাংলা")),
              ElevatedButton(
                  onPressed: () {
                    context.setLocale(const Locale('ur', 'PK'),);
                  },
                  child: const Text("Urdu"))
            ],
          ),
        ),
      ),
    );
  }
}
